+++
author = "Fred Liang"
categories = ["Share", "Web", "Design", "Technology"]
date = 2018-07-28T18:06:54Z
description = "一直在看阮一峰的每周分享 http://www.ruanyifeng.com/blog/ ，因为自己的视野和关注点和他有一些区别，借鉴了每周分享的形式，也希望把自己看见的正在发生的有意思的事情记录下来。"
draft = false
image = "/images/2018/07/pwa-fast.png"
slug = "2018-7-29-mei-zhou-fen-xiang"
tags = ["Share", "Web", "Design", "Technology"]
title = "2018.7.29 每周分享"

+++

>一直在看阮一峰的每周分享 http://www.ruanyifeng.com/blog/ ，因为自己的视野和关注点和他有一些区别，借鉴了每周分享的形式，也希望把自己看见的正在发生的有意思的事情记录下来。


## 1. 互联网

### 1.1 谷歌推出硬件产品“Titan”，即物理安全密钥
<img src="https://storage.fredliang.cn/web/google_cloud_titan.jpg" style="width:40rem;margin-left:0;"/>

>**原文链接：**[https://blog.google/](https://blog.google/products/google-cloud/building-on-our-cloud-security-leadership-to-help-keep-businesses-protected/)

推出的主要原因是谷歌开始要求其员工使用硬件安全密匙进行双重身份认证。

你在在线创建一个账户的时候只要将“Titan”插入USB口或者点击支持NFC技术的智能手机，PC设备便会同时创建两个加密凭证：一个公开密匙、一个私人密匙。在日后用户登录的时候，你所使用的平台在验证过公开密匙后，会要求用户点击“Titan”上的物理按钮，完成对私人密匙的认证。在这一过程中，不会有任何用户私人信息在互联网上传播，用户解锁账户的私人密匙也将仅仅保存在这一物理设备中，最大程度的保障了用户信息安全。

Titan将有两个版本：USB版和蓝牙版。USB版，很显然需要将设备插到电脑的USB端口展开认证，而蓝牙版则用于移动设备的无线认证。获悉，两款密匙设备的套装价将在50美元左右，单独购买的话售价大概是20美元或25美元。

### 1.2 Google 希望将 Go 打造成云端应用首选语言
<img src="https://storage.fredliang.cn/web/go-cloud-google.png" style="width:40rem;margin-left:0;"/>

> go-cloud 的 slogen 是：Write once, run on any cloud

Go Cloud Project是一项计划，允许应用程序开发人员在任何云提供商组合上无缝部署云应用程序。 它通过为存储和数据库等常见用途提供稳定的惯用接口来实现此目的。

该项目的一个关键部分是提供一个名为Wire的代码生成器。 它创建了可读的代码，只需要使用的提供程序导入云SDK。 这允许Go Cloud增长以支持任意数量的云提供商，而不会增加编译时间或二进制大小，并避免init()函数的任何副作用。

[google/go-cloud](https://github.com/google/go-cloud) 中的GitHub存储库目前包含Google Cloud Platform和Amazon Web Services实施，并且测试一切正常。 

现在较大项目的开发由于现有共有云平台的便捷性和成本的问题，很多公司都是自建的数据库，CDN，云储存等基础设施。如果该项目能够统一各个云平台的接入，也许能够看到大规模的云端应用实现吧。

### 1.3 LAVAS： 基于 Vue.js 的 PWA 解决方案
> 官网：[https://lavas.baidu.com/](https://lavas.baidu.com/)
> Github: [https://github.com/](https://github.com/lavas-project)

<img src="https://storage.fredliang.cn/web/baidu-larvas-screenshot.png" style="width:40rem;margin-left:0;"/>

最近想要在事业部推 PWA，所以这几天查了很多 PWA 的文档。中间发现百度 LAVAS 关于 PWA 的文档非常全面，于是深入了解了一下 LAVAS。

发现 LAVAS 解决方案中 LAVAS APP 是一个媲美 React Native 的移动端应用解决方案
1. 基础安装包只有300kb
2. 预缓存的一定资源
3. 不受系统浏览器限制

以下是此博客通过 LARVAS APP 打包成的 APK，实际体验可以说是出乎意料。
(由于一部分资源没有缓冲，出现样式乱了的情况下拉刷新一下)
**apk 链接：**[storage.fredliang.cn](https://storage.fredliang.cn/web/Fred's%20Blog.apk)(在浏览器打开)
OR **二维码下载**：
<img src="https://storage.fredliang.cn/web/blog-apk-qrcode.png" style="width:12rem;margin-left:0;"/>

### 1.4 Opera 浏览器上市
<img src="https://storage.fredliang.cn/web/opera_logo.png" style="width:40rem;margin-left:0;"/>

>招股书：[https://www.sec.gov/](https://www.sec.gov/Archives/edgar/data/1737450/000114420418036749/tv496863-f1.htm)

7月27日，23岁高龄的老牌浏览器Opera在纳斯达克成功上市。

招股书显示，截止2018年3月31日，Opera的平均月活跃用户高达3.22亿人。财务方面，Opera 2018年一季度营收3944.6万美元，较2017年同期的2547.5万美元增长54.8%；经调整后净利润987万美元，较2017年同期的78万美元实现大幅增长。2017年，Opera全年营收1.289亿美元，较2016年的1.0729亿美元增长20.2%；经调整后净利润1779.6万美元，较2016年的净亏损922.6万美元不仅实现扭亏为盈，且有了跨越式增长。整体来看，Opera的财务数据增长明显，并展现出了良好的利润率。

2016年，Opera实在经营不下去了，开始寻求出售，最终被周亚辉（昆仑万维总裁）和周鸿祎（奇虎360董事长）以81亿人民币全资收购，之后中方资本和管理层进驻Opera，并进行了一系列的中国式改造。

首先，将原本单纯的浏览器改造为集搜索、社交、内容为一体的综合性平台级应用，并增加信息流广告模式，利用已有的用户基础迅速规模化。其次，2017年1月，推出Opera News新闻服务，用人工智能算法进行内容分发和推荐，让Opera News成为了海外版今日头条。第三，以中国速度冲击非洲和东南亚市场，快速上线、快速导流、快速裂变，适应了中国严苛竞争环境之后，应对非洲和东南亚市场，简直就是高维打低维。

### 1.5 拼多多上市
<img src="https://storage.fredliang.cn/web/pinduoduo.jpg" style="width:40rem;margin-left:0;"/>

> **招股书：**[https://www.sec.gov/](https://www.sec.gov/Archives/edgar/data/1737806/000104746918005044/a2236163zf-1a.htm)

纽约时报的一个“特写”觉得描述的非常确切：

>李添强在拼多多上购买的商品包括一艘充气筏、一个钓鱼包和一辆樱桃红的玩具电动车，给年幼的女儿开着玩。他说在过去的两年中，在上面买了近7000元的东西，相当于他两个月的收入。

五花八门的产品选择，近乎白送的价格，各种优惠券和划算的交易，以及购物的便利性，使得在拼多多上的体验不太像购物，而更像是在玩一个购物视频游戏。在提交给监管机构的文件中，公司方面称这款应用是“好市多(Costco)和迪士尼乐园的结合”。

## 2. 设计
### 2.1 Framer 团队发布 Framer X

{{< video 
    poster="https://storage.fredliang.cn/video/Meet_Framer_X.mp4.png" 
    src="https://storage.fredliang.cn/video/Meet_Framer_X.mp4"
>}}

>**网站：**<https://framer.com/x>
>**博客：**[https://framer.com](https://framer.com/blog/posts/x-announcement/)
>
>
>We’re launching [a whole new product](https://framer.com/x), and it’s going to change the way you think about design tools.

Framer 的团队过去的6个月的版本迭代中，已经建立了新产品：Framer X。Framer 团队表示的使命始终是帮助设计师表达互动的想法。Framer是一个为支持端到端设计流程的交互设计工具。在此过程中，Framer 工具也逐渐变成了了两个产品。

Framer X将是一个全新的产品，比以往任何时候都更先进，允许使用组件构建整个交互式设计系统，所有这些都基于 React 和  ES6。

看起来设计师也要和现在前端一样两年换一套工具链了。

## 3. 挖点历史旧账
### 3.1 INFOSEEK 关闭搜索服务
<img src="https://storage.fredliang.cn/web/infoscreen1.jpg" style="width:40rem;margin-left:0;"/>

>图为当时的 INFOSEEK 使用指南
>
>**李彦宏关于INFOSEEK的博客:**  [http://home.donews.com](http://home.donews.com/donews/article/7/7219.html)
>感慨万千

可能现在已经没人知道 INFOSEEK 了，在Google问世之前，美国最成功的搜索引擎公司是Infoseek（李彦宏当时就在这里任职工程师）

因为是网景浏览器的默认搜索功能，所以 INFOSEEK 的市场份额很大，在1998年就已经收录了超过6400万张网页，但是因为没有商业模式，搜索服务其实是不挣钱的。INFOSEEK 开董事会，被股东质问：我们已经收录了这么多网页，每多收录一个，就要多承担一点服务器成本，却无法多创造一份收入，所以为什么还要继续收录网页呢？ INFOSEEK 的管理团队没有人能够回答这个问题，所以接下来 INFOSEEK 就不再继续收录网页了。1998年6月18日， INFOSEEK 被迪斯尼收购，同年9月放弃 INFOSEEK 改名go.com。而Google，则早已开始腾飞。


时间对于历史局限性的暴露，有的时候看起来特别匪夷所思，线在人人叫喊的流量变现，当时在 INFOSEEK 确没能走出来这一步。


### 3.2 PWA：下一代 Web 应用模型

<img src="https://storage.fredliang.cn/web/google-dev-pwa.png" style="width:40rem;margin-left:0;"/>

>推荐一篇博文：[https://huangxuan.me/](https://huangxuan.me/2017/02/09/nextgen-web-pwa/)

PWA 有两个核心：`Service Worker` 和 `manifest.json`

Service Worker 是一个可编程的 Web Worker，它就像一个位于浏览器与网络之间的客户端代理，可以拦截、处理、响应流经的 HTTP 请求；配合随之引入 Cache Storage API，你可以自由管理 HTTP 请求文件粒度的缓存，这使得 Service Worker 可以从缓存中向 web 应用提供资源，即使是在离线的环境下。

Web App Manifest，即通过一个清单文件向浏览器暴露 web 应用的元数据，包括名字、icon 的 URL 等，以备浏览器使用，比如在添加至主屏或推送通知时暴露给操作系统，从而增强 web 应用与操作系统的集成能力。

最惊讶的是国内生态对于 PWA 的支持程度：在<https://lavas.baidu.com/>中顶部点击`PWA 兼容性`

在浏览器打开这个博客浏览器应该会直接弹出来“添加到主屏幕”的横幅。

PWA 详细信息可以直接 Google。如果 PWA 能在事业部内推动，有时间的话我会详细写一下 PWA，内容不只是技术上实现，也许还会有业务数据上的支撑。先去写方案了~

