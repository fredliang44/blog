+++
author = "Fred Liang"
categories = ["Web", "Technology"]
date = 2018-10-15T10:57:16Z
description = "service worker 则是为解决“Web App 的用户体验不如 Native App”的普遍问题而提供的一系列技术集合，必然部分处理逻辑会牵扯到 UI 线程，从而在启动 service worker 的时候，UI 线程的繁忙也会影响其启动性能。"
draft = false
image = "/images/2018/12/photo-1536313068353-25ed2a981ea2.jpeg"
slug = "service-worker-shi-xian-xiao-xi-tui-song"
tags = ["Web", "Technology"]
title = "Service Worker 实现 web 应用消息推送"

+++

> 网站：<https://www.fredliang.cn>
> Github： <https://github.com/fredliang44/fredliang.cn>(暂未开源)

## Service Worker 介绍

Service Worker 是事件驱动的 worker，生命周期与页面无关，关联页面未关闭时，它也可以退出，没有关联页面时，它也可以启动.

service worker 则是为解决“Web App 的用户体验不如 Native App”的普遍问题而提供的一系列技术集合，必然部分处理逻辑会牵扯到 UI 线程，从而在启动 service worker 的时候，UI 线程的繁忙也会影响其启动性能。

### 丰富的离线体验

首先，一提到 service worker，很多人都会想到离线访问，而且不少文章都会提到，service worker 能提供丰富的离线体验，但实际情况来说，需要离线访问的场景很少，毕竟 web 最大的特点在于可传播性，所以 service worker 的离线体验主要还是在于解决页面加载的可靠性，让用户能够完整地打开整个页面，比如页面的白屏时间过长，网络不稳定造成的加载中断导致页面不可用。

有实际意义的离线，一般不是指断开网络能访问，而是指在用户想访问之前，能提前把资源加载回来。离线并不是一直都断开网络，而是在网络连接良好的情况下，能把需要的资源都加载回来。一些比较糟糕的做法是在 WIFI 网络下把整个 App 客户端的资源都拉下来，这样其实很多资源是用户不需要的，浪费了用户的网络和存储。Service worker 提供了更好更丰富的离线技术，Push / Fetch / Cache 这些技术的结合，能够提供非常完美的离线体验。比如，在小程序页面发版时，推送消息给客户端，客户端唤起页面的 service worker，去将需要用到的资源提前加载回来。

### 消息推送通知

Service worker 的消息推送，其实是提供了一种服务器与页面交互的技术。消息推送在 Native App 或 Hybird App 已经比较常见。很多 Hybird App 里面其实还会有一些 H5 页面，在没有实现 service worker 消息推送之前，消息是推送不到页面的。消息能推送到页面，意味着页面提前知道要发生的一些事情，把这些事情做好，比如，提前准备好页面需要的资源。Push 的推送服务器，Chromium 默认使用 GCM / FCM，在国内都不能访问，无法使用。浏览器厂商自己搭建 Push 服务器，成本也不低，目前国内还未有浏览器厂商支持标准的Push 服务。从 API 的使用规范来看，消息推送与通知弹窗的关联比较密切，基本上使用的业务场景仅限制在消息通知范围。

### 管理资源缓存

浏览器提供了很多存储相关的 H5 API，比如 application cache、localStorage，但都不是非常好用，主要是给予页端的控制权太少，限制太多，页端不能完全控制每一个资源请求的存储逻辑，或多或少会有一些趟不过的坑。Service worker Cache API 的出现彻底改变了这一局面，赋予了页端强大的灵活性，更大的存储空间。如何灵活地控制缓存，可以参考 Google 官方文章 《The Offline Cookbook》。

### 网络请求

在 Fetch 出现之前，页面 JS 一般通过 XHR 发起网络资源请求，但 XHR 有一定的局限性，比如，它不像普通请求那样支持 Request 和 Response 对象，也不支持 streaming response，一些跨域的场景也限制较多。而现在，Fetch API 支持 Request 和 Response 对象，也支持 streaming response，Foreign Fetch 还具备跨域的能力。

一般来说，基于 webview 的客户端拦截网络请求，都会基于 WebViewClient 的标准的 shouldInterceptRequest 接口。那么 service worker 的请求在 webview 还能不能拦截呢？WebViewClient 的标准的 shouldInterceptRequest 接口是拦截不了 service worker 的请求了，但 Chrome 49.0 提供了新的 ServiceWorkerController 可以拦截所有 service worker 的请求。另外，页端 JS 可以监听 Fetch 事件，通过 FetchEvent.respondWith 返回符合期望的 Response，即页端也能拦截 Response。

## 状态管理

Service worker 有两类状态，一类是 service worker 线程的运行状态，另一类是 service worker 脚本版本的状态。

1) Service worker 线程的运行状态, 一般对应 service worker 线程的状态，这类状态只保存在内存中。

STOPPED：已停止，EmbeddedWorkerInstance::OnStopped 时设置。
STARTING：正在启动，EmbeddedWorkerInstance::Start 时设置。
RUNNING：正在运行，EmbeddedWorkerInstance::OnStarted 时设置。
STOPPING：正在停止，EmbeddedWorkerInstance::Stop

## service-worker.js

### Work Box

通过 webpack4 引用 Google官方 workbox 
文档：<https://developers.google.com/web/tools/workbox/>

以下为 vue-cli3 的 pwa 部分的配置文件，详细关注 `workboxPluginMode` 和 `workboxOptions` 配置

文档：[https://developers.google.com](https://developers.google.com/web/tools/workbox/modules/workbox-webpack-plugin#configuration)

`workboxPluginMode` 有两个选项：
* `GenerateSW` 会生成默认的  service worke 文件并且注入相应配置到 webpack pipline, 适合简单的配置需求
* `InjectManifest`插件将生成一个预先缓存的URL列表，并将该预先缓存清单添加到现有的服务工作文件中，之后开发者可以注入自己的配置

#### 以下为 GenerateSW 样例文件
``` javascript
// Inside of webpack.config.js:
// example for GenerateSW

const {GenerateSW} = require('workbox-webpack-plugin');

module.exports = {
  // Other webpack config...
  plugins: [
    // Other plugins...
    new GenerateSW()
  ]
};
```

#### 以下为 InjectManifest 样例文件
必须在下方 `{option: 'value'}` 处指定 [swSrc](https://developers.google.com/web/tools/workbox/modules/workbox-webpack-plugin#full_injectmanifest_config)字段， 即为开发者手动注入的 service worker 文件 

如：` {swSrc: 'src/service-worker.js'}`
``` javascript
// Inside of webpack.config.js:
// example for InjectManifest

const {InjectManifest} = require('workbox-webpack-plugin');

module.exports = {
  // Other webpack config...
  plugins: [
    // Other plugins...
    new InjectManifest({option: 'value'})
  ]
};
```
    
## 个人博客案例：[fredliang.cn](https://www.fredliang.cn)
### `InjectManifest` 默认注入的部分(使用打包到本地的 workbox  库)
``` javascript
// dist/service-worker.js
importScripts("/precache-manifest.af203becffbeaafe01097d88c1c3b001.js", "/workbox-v3.6.2/workbox-sw.js");
workbox.setConfig({modulePathPrefix: "/workbox-v3.6.2"});
```

### 人工配置的文件部分
``` javascript
// continue
// dist/service-worker.js or src/service-worker.js 

workbox.core.setCacheNameDetails({prefix: "personal-website"});

workbox.skipWaiting();
workbox.clientsClaim();

/**
 * The workboxSW.precacheAndRoute() method efficiently caches and responds to
 * requests for URLs in the manifest.
 * See https://goo.gl/S9QRab
 */
self.__precacheManifest = [].concat(self.__precacheManifest || []);
workbox.precaching.suppressWarnings();
workbox.precaching.precacheAndRoute(self.__precacheManifest, {});


// html的缓存策略
workbox.routing.registerRoute(
  new RegExp('.*\.(?:html|json)'),
  workbox.strategies.networkFirst()
);

workbox.routing.registerRoute(
  new RegExp('.*\.(?:js|css)'),
  workbox.strategies.cacheFirst()
);

workbox.routing.registerRoute(
  new RegExp('https://stroage\.fredliang.\.cn/'),
  workbox.strategies.staleWhileRevalidate()
);

self.addEventListener('install', function(event){
  console.log('installed!');
})

self.addEventListener('activate', function(event){
  console.log('activated!');
});

self.addEventListener('message', function(event){
  console.log("SW Received Message: " + event.data);
});
```

以下为监听 webpush 行为部分
``` javascript
// handle webpush event
self.addEventListener('push', function(event) {
  const pushInfoPromise = fetch('https://open.fredliang.cn/blog/visitor')
    .then(function(response) {
      return response.json();
    })
    .then(function(response) {
      const title = 'Message from Fred Liang'
      const options = {
        body: 'currently ' + response.data + ' visitors',
        icon: '/img/icons/icon-128x128.png',
        renotify: true,
        actions: [],
        url: 'https://www.fredliang.cn/',
        tag: 'renotify'
      }

      return self.registration.showNotification(title, options);
    });

  const promiseChain = Promise.all([
    pushInfoPromise
  ]);

  event.waitUntil(promiseChain);
});

// handle notification close
self.addEventListener('notificationclose', function(event) {
  const dismissedNotification = event.notification;
  const promiseChain = console.log('notificationclose');
  event.waitUntil(promiseChain);
});

```

