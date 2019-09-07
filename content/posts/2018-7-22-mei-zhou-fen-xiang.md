+++
author = "Fred Liang"
categories = ["Share", "Technology", "Work", "Design"]
date = 2018-07-21T11:21:41Z
description = "一直在看阮一峰的每周分享 <http://www.ruanyifeng.com/blog/> ，因为自己的视野和关注点和他有一些区别，借鉴了每周分享的形式，也希望把自己看见的正在发生的有意思的事情记录下来。"
draft = false
image = "/images/2018/07/https_-2F-2Fhypebeast.com-2Fimage-2F2018-2F07-2Fgoogle-facebook-microsoft-twitter-data-transfer-project-squashed.jpg"
slug = "2018-7-22-mei-zhou-fen-xiang"
tags = ["Share", "Technology", "Work", "Design"]
title = "2018.7.22 每周分享"

+++

>一直在看阮一峰的每周分享 <http://www.ruanyifeng.com/blog/> ，因为自己的视野和关注点和他有一些区别，借鉴了每周分享的形式，也希望把自己看见的正在发生的有意思的事情记录下来。

## 1. 互联网
### 1.1 Google, Facebook, Microsoft, Twitter 联合发布数据转移标准

<img src="https://storage.fredliang.cn/web/datatransfer.png" style="width:10rem;margin-left:0;"/>

**仓库网址：**<https://github.com/google/data-transfer-project>
**官网：**<https://datatransferproject.dev/>

几家世界上最大互联网公司正在搭建一个新的数据传输项目，方便不同用户在不同平台之间迁移数据，这个项目命名为`Data Transfer Project`。

该项目当前版本支持照片，邮件，联系人，日历和任务的数据传输。它需要来自Google，Microsoft，Twitter，Flickr，Instagram，Remember the Milk 和 SmugMug的公开API。虽然许多转移已经可以由其他方法制定，但与现有的传统API相比，参与者希望使项目更“强大和灵活”，摆脱之前需要单独对接 API 对于用户和研发人员的不友好。

微软在[一篇博客](https://blogs.microsoft.com/eupolicy/2018/07/20/microsoft-facebook-google-and-twitter-introduce-the-data-transfer-project-an-open-source-initiative-for-consumer-data-portability/)中表示“可移植性和互操作性是云创新和竞争的核心”。微软前天在财报电话会上披露：微软云服务品牌Azure业务在本季度实现了90%的营收增长，而Azure premium营收则连续13个季度实现三位数（100%）增长。


### 1.2 Google：对于 Fuchsia OS 目前没有日程安排
<img src="https://storage.fredliang.cn/web/fuchsia.png" style="width:10rem;margin-left:0;"/>

**仓库地址：**<https://github.com/fuchsia-mirror>

为什么 Google 出面澄清这件事，因为有一些媒体较夸大地说 [“Android 已死”](https://www.zdnet.com/article/android-as-we-know-it-is-dead-but-its-not-going-to-go-away/) ，至于原因还是之前的这一波 Fuchsia OS。

目前根据开发者的反馈， Fuchsia OS 是一个通用性极强的操作系统，适用于从嵌入式设备到汽车在内众多设备，当然也包括智能手机、平板电脑和 PC。

Fuchsia OS 有几点比较有趣：
1. 官方开发语言为 Dart，一个 Google 主导的面向对象，还处于早期期阶段的编程语言。
2. 跨平台，几乎涵盖了所有主流的操作平台。
3. 兼容Android，可直接延续 Android 生态。

对于整个 Fuchsia 项目，目前还处于非常早期的阶段，Google 对于这个项目的官方态度也比较暧昧。

说道 Fuchsia， 不得不说 Flutter。Flutter 同样是一个同样基于 Dart 语言的跨平台移动UI框架。在2018 GMTC大会上 Google Flutter 宣布了首个发布预览版同时，闲鱼作为国内第一个在产品中使用 Flutter 的企业进行了 Flutter 的[实践效果分享](https://juejin.im/entry/5b35f469f265da598c09e45c)。



### 1.3 云上贵州(国内iCloud用户的服务商)将把用户数据存储在中国电信的云服务上
<img src="https://storage.fredliang.cn/web/icloud.webp" style="width:40rem;margin-left:0;"/>

原文：<https://mp.weixin.qq.com/s/c2-hQ7WFWkGRNcfD0YlYVw>

自2018年2月28日中国内地的iCloud业务正式由云上贵州负责运营后，云上贵州牵手中国电信天翼云为iCloud提供云存储服务，双方已于6月底正式签署《基础设施协议》。

后续苹果用户的 iCloud 的数据将保存在中国电信的服务器上。有点意外的是，根据官方推文，在关系Apple 用户 iCloud 数据的签字仪式上没有看到一个 Apple 的 Logo 或工作人员。


### 1.4 新加坡150万名病患的个人资料被窃

黑客利用恶意软件入侵了新加坡保健服务集团(SingHealth)的系统。从今年6月27日至7月4日， 共盗取了150万名病患的个人资料，其中16万人的开药记录也被盗窃。被盗的个人资料包括姓名、身份证号码、地址和出生日期等，受害者还包括总理李显龙。


## 2. 设计
### 2.1 Adobe XD 推出中文免费版
<img src="https://wwwimages2.adobe.com/content/dam/acom/en/products/experience-design/sept2017/images/xd-riverflow1-720x620.jpg" style="width:40rem;margin-left:0;"/>

**官网链接：**<https://www.adobe.com/products/xd.html>

Adobe XD 经历了免费-->付费-->免费的过程，刚刚又推出了中文版，可见 Adobe 对（XD）Experience Design 的看重。

Adobe 坐拥 PS、AI 两大杀手锏，在 Sketch，Invison 等新兴工具的夹击下，在产品策略上做了快速地改变。XD 实际上使用门槛非常低，可以作为 Adobe Suite 的一个入口级应用。。

在功能上，Adobe XD 还吸收了 Sketch 的优点，包括更加便捷的编辑功能和多画板管理。本身 XD 跨平台的性质让很多 Windows 设计师有一个更加便捷的界面构建渠道。

不仅如此，Adobe 还打算拿出1000万美金作为投资和奖励，来推动社区开发 XD 相关的插件，用来增强「XD生态系统」，目前设计软件的生态应该是 Sketch 最为活跃，不知道在“重赏之下”会不会让 XD 超越 Sketch 在轻量级界面设计软件的霸主地位。

### 2.2 Invision Studio & Invision Platform

<img src="https://storage.fredliang.cn/web/invison_platform.jpg" style="width:40rem;margin-left:0;"/>

**官网链接：**<https://www.invisionapp.com/studio>

之前有内部安利过 Invison 的工作流，但是因为学习成本的问题没有推得动。

尽管 Invision Studio 还处于内测阶段，但 Invision 在设计工作流的布局还在快速推进，推出了 Invision Platform，slogen 是“Design the future， Together”

Invision Platform 就像是 Invision Studio 的应用中心，现在已经提供了 UI / UX工具包，组件，字体，图标等应用程序，它们已集成到工作流程的每个步骤中，与 Invision Studio 完美配合。

### 2.3 Google 产品 redesign
<img src="https://storage.fredliang.cn/web/googe_redisign.jpg" style="width:40rem;margin-left:0;"/>

**官方博客：**<https://material.io/articles/how-google-created-a-custom-material-theme.html#01>

今年第一季度开始，Google 部分产品开始使用这次更新的 Material Design 设计。至于为什么放到这周，主要是 Google 搜索的 A/B Test 终于 Test 到我了。

Gmail，Google 新闻，Google Pay 和 Google Home 的产品团队在这篇博客中分享了自己在此次 redesign 过程中的心得，值得一看。

同时 Google 在移动端的 Google 登录已经开始使用 Google 品牌字体 `Google Product Sans`，最早一篇相关文章可以追溯到去年 Google 的 Logo redisgn 的博客 <https://design.google/library/evolving-google-identity/>
## 3.工具
### 3.1 fathom：一个开源网站访问监控工具，基于Golang & Preact
<img src="https://github.com/usefathom/fathom/raw/master/assets/src/img/fathom.jpg?v=7" style="width:40rem;margin-left:0;"/>

**仓库地址：**<https://github.com/usefathom/fathom>

### 3.2 Microsoft Teams 免费
<img src="https://c.s-microsoft.com/en-us/CMSImages/Hero_MSTeams_HP_960x600px.png?version=bbdd7348-f610-0403-b869-a127f7ca06f2" style="width:40rem;margin-left:0;"/>

今年三月份发布的 Teams 本身没有什么改动，而是微软增加了一个免费的方案，希望能降低试用的门槛，意在抢占 Slack 的市场。

微软开放了 Microsoft Teams 的使用，Teams 有点类似于 Slack，同时能与微软其它Office办公组件紧密整合，包括 Word、Excel、PowerPoint、OneNote、SharePointPlanner、PowerBI 等。

该协作工具提供了Android、iOS、Mac、Windows以及web等形式的客户端，共支持19种语言，面向181个国家开放。

### 3.3 CloudMounter 将网络存储挂载到本地（网盘、对象存储、服务器）
<img src="https://cloudmounter.net/images/logo-hover@2x.png" style="width:10rem;margin-left:0;"/>

**官网：**<https://cloudmounter.net/>

CloudMounter为低容量 SSD 的 Mac 电脑用户提供了一个能将大多数流行云作为磁盘安装，而无需下载硬盘驱动器上的在线文件的工具。同时提供数据加密的来确保文件安排，支持Dropbox，Google Drive和OneDrive，可以在Finder中免费管理它们。


### 3.4 bisecu 一个自行车锁解决方案

<img src="https://storage.fredliang.cn/web/bisecu.jpg" style="width:40rem;margin-left:0;"/>

**官网：**<https://www.bisecu.com/>

**indiegogo众筹：**[https://www.indiegogo.com/](https://www.indiegogo.com/projects/bisecu-the-smartest-bike-lock-in-the-world#/comments)

Bisecu 装在前轮轴心，通过蓝牙连接手机。利用手机自动上锁解锁。通过蓝牙的连接，骑车的人可以在几步之外控制智慧锁的开关，Bisecu 也可以随着车主的靠近和离开，自动开锁和上锁，并且具备报警功能。若上了锁，前轮就会被固定住。当有人试图偷车，感应器就会触发警报。Bisecu 也具备记录车速、行程、定位功能。

现在问题是可能 $99 的车锁可能比自行车贵。

