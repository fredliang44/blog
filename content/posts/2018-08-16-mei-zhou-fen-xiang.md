+++
author = "Fred Liang"
categories = ["Share", "Technology", "Design", "Product Manager"]
date = 2018-08-25T23:30:09Z
description = "一直在看阮一峰的每周分享 http://www.ruanyifeng.com/blog/ ，因为自己的视野和关注点和他有一些区别，借鉴了每周分享的形式，也希望把自己看见的正在发生的有意思的事情记录下来。"
draft = false
image = "/images/2018/08/wasm.png"
slug = "2018-08-16-mei-zhou-fen-xiang"
tags = ["Share", "Technology", "Design", "Product Manager"]
title = "2018.8.16 每周分享"

+++

>一直在看阮一峰的每周分享 <http://www.ruanyifeng.com/blog/> ，因为自己的视野和关注点和他有一些区别，借鉴了每周分享的形式，也希望把自己看见的正在发生的有意思的事情记录下来。

## 1. Tech

### 1.1 DJI Mavic 2

<img src="https://storage.fredliang.cn/web/2018-08-26-dji-mavic.jpg" style="width:40rem;margin-left:0;">

> 测评链接：<https://www.ifanr.com/1089539>

这次大疆发布的是两台「御」系列的无人机
* 搭载了 1 英寸大底的 Mavic 2 Pro，搭载了哈苏的定制镜头
* 可以实现两倍变焦的 Mavic 2 Zoom

Mavic 2 Pro（专业版）价格为 9588 元，Mavic 2 Zoom（变焦版）价格为 7888 元。



### 1.2 WebAssembly

<img src="https://storage.fredliang.cn/web/2018-08-26-wasm.png" style="width:40rem;margin-left:0;"/>

至于为什么又拿 WebAssembly 出来，是因为有了一些 wasm 的玩法和自己有一点想法。
同时 golang 刚刚发布 1.11 release 版本，官方支持编译成 wasm。

在做 PWA 的时候，一直在给前端工程师纠正 Service Worker 的缓存概念。通过 Service Worker 网络代理的缓存概念类似于发版，相对传统 Cache 的概念对于 Bug 的容忍度会低很多。

Web 逐渐向通用性，工程化的路径在走，加上本身移动端流量侵蚀了很大一部分 PC web 流量。 
* PC 端 Web 的发展从需求上看，在向中后台走。
* 从工程的上在往复杂化在走。

如果通过 WebAPP 能解决的强需求，可以节约很多用户适配 Win，macOS，Linux 的人力资源。

后续如果以“插件”的观念来理解 WebAssembly，可以说 WebAssembly 能解决现在需要安装的应用80% 的需求。

### 1.3 Service Mesh

<img src="https://storage.fredliang.cn/web/2018-08-26-070153.png" style="width:40rem;margin-left:0;"/>

实习的时候，在跟公司基础架构的同学在聊。在 k8s 之后，现在在将 service mesh 并入内部调度系统。

Service mesh 又译作 “服务网格”，作为服务间通信的基础设施层。
Service mesh 有如下几个特点：

* 应用程序间通讯的中间层
* 轻量级网络代理
* 应用程序无感知
* 解耦应用程序的重试/超时、监控、追踪和服务发现

目前两款流行的 service mesh 开源软件 Istio 和 Linkerd 都可以直接在 kubernetes 中集成，其中 Linkerd 已经成为 CNCF 成员。


### 1.4 接口设计

<img src="https://storage.fredliang.cn/web/2018-08-26-flickr-logo.jpg" style="width:40rem;margin-left:0;"/>

>接口文档：<https://www.flickr.com/services/api/>

在自己设计 restful 接口的时候，有的接口没有一个方式去适配 restful 接口的设计理念。flickr 的接口是一个很好的参考方案。

且不论产品, flickr 的整套 restful 接口设计是一套很好的实际案例，值得后续深入了解。

### 1.5 .gitattributes
<img src="https://storage.fredliang.cn/web/2018-08-26-1_FPd6EQEG3rr1Uno12EemqA.png" style="width:40rem;margin-left:0;"/>

>文档链接: [https://git-scm.com/](https://git-scm.com/book/zh/v1/%E8%87%AA%E5%AE%9A%E4%B9%89-Git-Git%E5%B1%9E%E6%80%A7)

大家在上传 github 项目的时候，一般只附带了.gitignore。在这推荐一下 .gitattributes文件。

一些设置项也能被运用于特定的路径中，这样，Git 以对一个特定的子目录或子文件集运用那些设置项。这些设置项被称为 Git 属性，可以在你目录中的 `.gitattributes` 文件内进行设置（通常是你项目的根目录），也可以当你不想让这些属性文件和项目文件一同提交时，在`.git/info/attributes`进行设置。



## 2. 设计
### 2.1 Firefox 品牌设计更新

<img src="https://storage.fredliang.cn/web/2018-08-24-114714.jpg" style="width:40rem;margin-left:0;"/>

>由 Mozilla 的产品/品牌设计师组成的团队已经开始想象一个新的系统，以涵盖所有正在酝酿中的Firefox 产品以及那些仍在新兴技术部门设计中的产品。为了避免在传统的设计孤岛中工作，我们正在设计一个系统，可以引导人们顺利地从我们的营销到我们的产品体验。
>
>原始链接：[https://blog.mozilla.org/](https://blog.mozilla.org/opendesign/evolving-the-firefox-brand/)

Firefox 的设计系统迭代方式很有意思，有争议的地方每次都是民主投票，有意见可以直接提交自己的方案。
这就成为窥视目前主流审美的一个窗口。

### 2.2 Loading 设计

>已经单独写了一篇博客[做好 loading 设计](https://blog.fredliang.cn/2018/08/24/zuo-hao-loading-she-ji/)

在前端产品中，我们无法保证用户的网络情况，也很难从最末端节点优化自有网络部署。
这些或多或少地都会反映到用户端的加载延迟。

Loading 的产生是为了在无法立即呈现的界面中优化用户的使用体验。
反过来看，Loading 动画能够为资源准备工作提供更多的加载时间，提高用户的转化率。

*也就是说 Loading 是为了缓解加载延迟提供的一个视觉\交互方案，形成一个连贯的视觉体系。*

## 3. 一点想法
### 3.1 产品是函数
<img src="https://storage.fredliang.cn/web/2018-08-26-073434.png" style="width:60rem;margin-left:0;"/>

> 博文链接: [https://www.feltpresence.com/](https://www.feltpresence.com/functions.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website)

跟不同的人去沟通需求的时候，尤其当比较混乱甚至跑偏的时候，会打断并询问，你想要什么“输入”，你想要什么“输出”。

设计产品，尤其是工具类的产品，在设计之前会有一套现成的解决方案，从现有以 IO 的角度去理清需求，很容易设计出来一套解决方案。

给一堆输入，进行各种转换，最后输出结果。产品是用来解决问题的。输入：某种问题、某种情况；输出：解决了问题、变得更好了（更快、更省钱等）。

### 3.2 价值就是去解决问题

浏览语雀的时候，看见 `玉伯` 的[一篇文章](https://www.yuque.com/yubo/blog/bocvvu)。

回过头看，从解决问题的角度来看，很多工作实际上是没有意义的，很多有价值的工作自己在接手的时候是迟疑或者自我怀疑的的状态中。

