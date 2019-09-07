---
title: "小程序标准化 & PWA"
date: 2019-05-15T14:33:17+08:00
draft: false
description: "最近看到了W3C的《下一代移动 Web 应用（小程序/快应用）标准化研讨会》的会议记要，整理下一些看法"
tags: ["Product Manager","Technology"]
---

## 1. 关于标准化

2018年1月完成了W3C中文兴趣组章程草稿的撰写，2018年6月正式成立W3C中文兴趣组，讨论了一些proposal，希望能够转化为W3C标准

希望能够一起撰写一个白皮书之类的文档，定义小程序，并提交到W3C

> 标准不只是paperwork
> 只写一个提案出来是不够的
> 标准需要运作，需要建立市场
> 需要真正去做事情

对于不适合标准化的部分，我们也无需勉强
小程序大部分的市场都在中国，所以在中文兴趣组里先讨论完这个事情再推到W3C效率比较高

## 2. W3C 想法 -> 流程

### 2.1 W3C 社区组

首先需要建一个社区
EX. [WebAssembly](https://www.w3.org/community/webassembly/), [WebGPU](https://www.w3.org/community/gpu/)

### 2.2 Web 孵化社区组

> 我们希望给你的，是在你构想提案的过程给予反馈，是在你把提案呈现到正确的组织后、帮助你迭代和推进你的想法。
>
> --Marcos Caceres, WICG联合主席

### 2.3 获得 TAG 的审阅和建议

在 Github 的 [w3ctag/design-reviews](https://github.com/w3ctag/design-reviews) 进行审议

`Technical Architecture Group` (TAG) 负责设计整个 Web 的架构，并且协助整个社区完善它。它的 10 位工程师由 W3C 选举产生或由 Tim Berners-Lee 直接指派，通过协调、合作和审阅来维护和扩展 Web。

### 2.4 会员正式递交提案

把提案递交到 W3C 会员

EX.: [Vehicle Information Access API](https://www.w3.org/Submission/2016/01/) from 大众汽车

### 2.5 W3C Strategy Funnel

详见孵化管理平台：<https://www.w3.org/Strategy/funnel>

## 3. mini app, super app, native app

一个比较有意思的来自高德纳公司的“移动应用程序的体验和技术周期”
![ ](https://storage.fredliang.cn/web/2019-05-15-065313.png)

### 3.1 PWA

去年在做调研的时候，国内主要是 新浪微博，eleme，Ali Express 几个大厂在PWA相关方面的时间比较多

以下是 16 年实习期间关于 PWA 早期支持的一个需求文档：
{{<pdf "h5-retention-promotion-plan.pdf">}}

但是从国内大环境来看，支持PWA还是有很多痛点的：

* 移动端浏览器碎片化
* 接口和浏览器支持未标准化
* 类似fcm的推送机制无法实现

但是 PWA 在原有 web 的能力上做了很多拓展：

**比如:**

1. 你的网站如果想要留存客户，推送消息，只需要简单的外挂 PWA 的 Service Worker 和 Notification 就行
2. 客户网络环境不好可以预加载资源，甚至控制网络情况

### 3.2 小程序

目前的几个特点

* 非常成功：极高的DAU / MAU和高增长
* 混乱：不同提供商有多个标准
* 实用：例如：付款，市场和许多其他方面。
* 用户参与：多种方式接近用户，可以直接进入大型应用程序

劣势：

* 首次打开速度
* 小程序的渲染性能
* 开发和调试流程复杂
* 社区混乱

优势：

* 多平台运行
* 平台直接开放流量

### 3.3 共性

* 通过Web技术驱动，看起来像原生应用，并由服务支持
* 多个应用程序门户/入口（小程序是分散的入口）
* 解决应用程序痛点：重量轻，即时启动，可共享等
* 开发者能够能够进行快速更新，分发等

另：小程序和 PWA 是否有合并 or 统一标准化的可能性？

### 3.4 Instant Apps

### 3.5 趋势

* 随着网络环境提升，app能够提供渐进式安装，降低使用门槛
* 入口多样化，摆脱之前web和应用商店两大分发入口
* 业务延展性增强，例如支付、用户账户管理逐渐下沉到 OS 层

未来有可能成为国外大型APP `copy-from` 的案例

**`// TOBE CONTINUED`**

> 相关链接：
> 研讨会会议纪要：<https://www.w3.org/2019/05/11-chinese-web-minutes.html>