+++
author = "Fred Liang"
categories = ["Golang", "Technology"]
date = 2018-04-30T11:32:00Z
description = "GraphQL提供了一种灵活而有效的方式来查询服务器中的数据。 它正在成为设计后端的流行技术，通常会替换或封装一些不灵活的REST API，并让客户负责决定他们需要的数据。 现在有许多用于编写JavaScript的GraphQL客户端和服务器的库和框架，其中最着名的是Apollo和Graphcool 。 Apollo团队还开发了针对WebSockets的GraphQL协议，该协议主要用于Apollo Client和Graphcool中的Subscriptions。"
draft = false
image = "/images/2018/05/go.jpg"
slug = "zai-gozhong-gou-jian-dai-ding-yue-de-graphqlfu-wu-qi"
tags = ["Golang", "Technology"]
title = "[翻译]构建带 Subscriptions 的 graphql  golang 后端"

+++

GraphQL提供了一种灵活而有效的方式来查询服务器中的数据。 它正在成为设计后端的流行技术，通常会替换或封装一些不灵活的REST API，并让客户负责决定他们需要的数据。 现在有许多用于编写JavaScript的GraphQL客户端和服务器的库和框架，其中最着名的是Apollo和Graphcool 。 Apollo团队还开发了针对WebSockets的GraphQL协议，该协议主要用于Apollo Client和Graphcool中的Subscriptions。

# 1.介绍graphqlws
今天，我们开放了一个新的Go库来填补这个空白： [graphqlw](https://translate.googleusercontent.com/translate_c?act=url&depth=1&hl=zh-CN&ie=UTF8&prev=_t&rurl=translate.google.com&sl=en&sp=nmt4&tl=zh-CN&u=https://github.com/functionalfoundry/graphqlws&xid=17259,15700023,15700043,15700124,15700149,15700168,15700173,15700186,15700189,15700201&usg=ALkJrhjfxYRZHfHWftMQ04s1TAommIZO6A)。 它有一个简单的目的：

1. 实现[GraphQL在WebSocket](https://github.com/apollographql/subscriptions-transport-ws/blob/master/PROTOCOL.md)（由所有流行的GraphQL客户端使用），所以不必考虑与net/http无缝集成
2. 与net/http无缝集成
3. 提供访问已建立订阅的简单方法，执行身份验证并向相应的客户端发送更新。
你可以在<https://github.com/functionalfoundry/graphqlws>上的GitHub上找到它。

## 第1步 - 基本设置
使用graphqlws在WebSocket端点上设置GraphQL很简单。 创建一个GraphQL模式，创建一个订阅管理器，为WebSocket上的通信创建一个HTTP处理程序，然后使用net/http服务处理程序。 或者，您可以定义一个函数来对用户进行身份验证（在建立新连接时，Apollo客户端会将初始WebSocket消息与可选的`authToken`一起发送;该函数允许将令牌字符串解析为用户）。
```go
package main

import (
	"net/http"

	"github.com/functionalfoundry/graphqlws"
	"github.com/graphql-go/graphql"
)

func main() {
	// Create a GraphQL schema with a subscription object
	schema, err := graphql.NewSchema(graphql.SchemaConfig{
		Subscription: graphql.NewObject(...),
	})
	
	// Create a subscription manager
	subscriptionManager := graphqlws.NewSubscriptionManager(&schema)

	// Create a WebSocket/HTTP handler
	graphqlwsHandler := graphqlws.NewHandler(graphqlws.HandlerConfig{
		// Wire up the GraphqL WebSocket handler with the subscription manager
		SubscriptionManager: subscriptionManager,

		// Optional: Add a hook to resolve auth tokens into users that are
		// then stored on the GraphQL WS connections
		Authenticate: func(authToken string) (interface{}, error) {
			// This is just a dumb example
			return "Joe", nil
		},
	})

	// The handler integrates seamlessly with existing HTTP servers
	http.Handle("/subscriptions", graphqlwsHandler)
	http.ListenAndServe(":8080", nil)
}
```

## 第2步 - 使用 Subscriptions

Graphqlws库本身仅仅实现了基于WebSocket协议的GraphQL。 它没有实现任何开箱即用的订阅。 一个典型的服务器实现将监听数据库的变化，并通过识别哪些订阅需要更新，重新执行这些订阅的查询并将结果发送给相应的订阅客户端来对这些更改做出反应。

以下代码示例显示了订阅管理器在任何时候如何检索订阅。 他们按照他们的关系分组。 每个连接都有唯一的ID，可选地，还有前面描述的Authenticate函数返回的用户。

每个订阅都存储订阅查询（ `Query` ， `Variables`和`OperationName` ）以及可用于识别订阅的数据类型（例如`Fields`和`Document` ）的其他信息。

使用`Query` ， `Variables`和`OperationName`可以在需要时重新执行订阅查询。 然后可以通过`SendData`方法将结果发送到订阅客户端，如下面的代码示例所示:

```go
// This assumes you have access to the above subscription manager
subscription := subscriptionManager.Subscriptions()

for _, conn := range subscriptions {
	// Things you have access to here:
	conn.ID()   // The connection ID
	conn.User() // The user returned from the subscription manager's Authenticate
	
	for _, subscription := range subscriptions[conn] {
		// Things you have access to here:
		subscription.ID            // The subscription ID (unique per conn)
		subscription.OperationName // The name of the subcription
		subscription.Query         // The subscription query/queries string
		subscription.Variables     // The subscription variables
		subscription.Document      // The GraphQL AST for the subscription
		subscription.Fields        // The names of top-level queries
		subscription.Connection    // The GraphQL WS connection

		// Prepare an execution context for running the query
		ctx := context.Context()

		// Re-execute the subscription query
		params := graphql.Params{
			Schema:         schema, // The GraphQL schema
			RequestString:  subscription.Query,
			VariableValues: subscription.Variables,
			OperationName:  subscription.OperationName,
			Context:        ctx,
		}
		result := graphql.Do(params)

		// Send query results back to the subscriber at any point
		data := graphqlws.DataMessagePayload{
			// Data can be anything (interface{})
			Data:   result.Data, 
			// Errors is optional ([]error)
			Errors: graphqlws.ErrorsFromGraphQLErrors(result.Errors),
		}
		subscription.SendData(&data)
	}
}
```

## 第3步 - 与graphql-go / handler结合使用
结合使用WebSocket端点上的GraphQL和普通的GraphQL HTTP端点，就像其他任何`net/http`处理程序一样工作。 您只需创建两个处理程序并通过不同的路线提供服务。 以下代码示例演示了这一点。
```go
package main

import (
	"net/http"
	
	"github.com/functionalfoundry/graphqlws"
	"github.com/graphql-go/graphql"
	"github.com/graphql-go/handler"
)

func main() {
	// Create a GraphQL schema with a subscription object
	schema, err := graphql.NewSchema(graphql.SchemaConfig{
		Subscription: graphql.NewObject(...),
	})
	
	// Create a GraphQL over WebSocket handler
	subscriptionManager := graphqlws.NewSubscriptionManager(&schema)
	graphqlwsHandler := graphqlws.NewHandler(graphqlws.HandlerConfig{
		SubscriptionManager: subscriptionManager,
	})
	
	// Create a GraphQL over HTTP handler
	graphqlHandler := handler.New(&handler.Config{
		Schema: &schema,
		Pretty: true,
		GraphiQL: true,
	})
	
	// Serve both handlers on different endpoints
	http.Handle("/", graphqlHandler)
	http.Handle("/subscriptions", graphqlwsHandler)
	http.ListenAndServe(":8080", nil)
}
```
# 概要
如果你已经做到了这一点，你可能有兴趣使用Go作为你自己的GraphQL服务器。 借助[`graphqlws`](https://github.com/functionalfoundry/graphqlws)，现在可以轻松实现服务器端GraphQL订阅。 
来吧，你可以尝试一下！
我们希望你喜欢它。


---

在[GitHub](https://github.com/functionalfoundry/graphqlws)上提交 bug 或 issue 。

如果您正在寻找下一个项目的React或GraphQL开发方面的帮助，我们很乐意在[Functional Foundry](https://translate.googleusercontent.com/translate_c?act=url&depth=1&hl=zh-CN&ie=UTF8&prev=_t&rurl=translate.google.com&sl=en&sp=nmt4&tl=zh-CN&u=https://functionalfoundry.com/&xid=17259,15700023,15700043,15700124,15700149,15700168,15700173,15700186,15700189,15700201&usg=ALkJrhjGYg7zQc3o9WECE9bUWMeel71BDA)处听到您的消息。

