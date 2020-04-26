---
author: "Fred Liang"
categories: ["Web", "Design", "Technology", "Work"]
date: 2018-01-01T09:22:44Z
description: "秋招 H5 移动端（面向微信）设计师出的落地页的动画层数有30层左右，在通过 bodymovin 导入前端页面中后再加好素材之后仍有5秒左右黑屏渲染动画目前前端渲染有以下方案"
draft: false
image: "https://images.fredliang.cn/photo-1499175860898-fa38bee4bcdd?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&s=8412b78d9c7dd5ec2bfd17ed7be486d7"
slug: "yi-dong-duan-web"
tags: ["Web", "Design", "Technology", "Work"]
title: "移动端 Web 渲染解决方案"

---

# 背景
秋招 H5 移动端（面向微信）设计师出的落地页的动画层数有30层左右，在通过 bodymovin 导入前端页面中后再加载好素材之后仍有5秒左右黑屏渲染动画
目前前端渲染有以下方案

* SVG
* Canvas
* WebGl
* mp4
* gif

由于涉及到渲染瓶颈问题，以及可行性问题，所以把目前想到的所有方案都尝试了

>有坑的地方
> 1. 位图需要的运算量
> 2. Canvas 实际的加速效果
> 3. SVG 与 Canvas 渲染速度的比较
> 4. 微信使用QQ浏览器的X5内核，实际使用渲染效率极低
> 5. gif以及 mp4的大小问题
> 6. ……


# 方案综述

## SVG ([W3C](https://www.w3.org/TR/SVG/REC-SVG11-20110816.pdf))
SVG 指可伸缩矢量图形 (Scalable Vector Graphics)
SVG 用来定义用于网络的基于矢量的图形
SVG 使用 XML 格式定义图形
SVG 图像在放大或改变尺寸的情况下其图形质量不会有所损失


PS：`SVG` 在`IE9`以及`Firefox`和`chrome`下都支持

SVG 本身基于图形元素（矢量），用户交互到图形元素，适合大面积小数量的应用场景

SVG 的另一个关键区分因素是能够进行代码交互且不复杂。正如 SVG 具有一个类似 HTML 的可编程 DOM 一样，它还具有事件模型。

设计师通过 AE 导入的 svg 实际上是“假的” svg 应为实际上是动画通过 svg 设置，所有的静态图像都是 img 文件夹中的 png 文件



## Canvas ([W3C](https://www.w3.org/TR/2dcontext/))

同样，IE9之前的浏览器都不支持`<canvas>`元素，canvas和SVG的主要区别是：使用canvas绘制图形是通过调用其API，而SVG则是通过构建一棵XML元素树来实现的。

另一种向用户提供更丰富的图形体验的方法，通过`<canvas> `标记提供，该标记由 Apple for Safari 在 HTML5 中或在其他图形小工具中引入。它在绘制即时模式图形（包括矩形、路径和图像）方面公开更具编程性的体验，与 SVG 类似。即时模式图形呈现是一个“触发即忘”模型，该模型将图形直接呈现到屏幕上，但随后对所完成的操作不保留任何上下文。与保留模式相反，不保存呈现的图形；要在每次需要新框架时描述整个场景，开发人员需要重新调用所有必需的绘图命令，而不考虑实际更改（SVG 已知拥有“场景图”）。

因而与 SVG 不同，既没有任何样式也不支持多个几何图上的命中检测。另外，因为 Canvas 不支持可伸缩性，所以缩放时图片将很快失真。

在测试 Canvas 渲染的时候图片边缘基本上都出现了明显的锯齿。

## SVG VS Canvas
来自 **MSDN: SVG 与 Canvas:如何选择**

| Canvas                                                        | SVG                                                         |
| ------------------------------------------------------------- | ----------------------------------------------------------- |
| 基于像素（动态 .png）                                         | 基于形状                                                    |
| 单个 HTML 元素                                                | 多个图形元素，这些元素成为 DOM 的一部分                     |
| 仅通过脚本修改                                                | 通过脚本和 CSS 修改                                         |
| 事件模型/用户交互颗粒化 (x,y)                                 | 事件模型/用户交互抽象化 (rect, path)                        |
| 图面较小时、对象数量较大 (>10k)（或同时满足这二者）时性能更佳 | 对象数量较小 (<10k)、图面更大（或同时满足这二者）时性能更佳 |

>PS:关于10K这个分界线的来源不是很清楚

根据 MSDN 的解释，SVG 和 Canvas 能够实现几乎相同的效果，在不同应用场景下 SVG 和 Canvas 的优势差距会很大。

因为我们目前瓶颈在于渲染性能，着重讨论一下性能问题
从性能方面选择：

有时存在一些外部影响，要求独立于（或几乎独立于）功能选择技术。有关使用 Canvas 或 SVG 的问题，存在两个主要区别。

有时开发人员的知识、技能组合和现有资产会对技术的选择起到重大作用。如果开发人员具备低级别图形 API 方面的深层知识，但在 Web 技术方面知识有限，则很可能会选择 Canvas 技术。
![](https://static.fredliang.cn/2018-01-02-15011819399878.png)


另外，性能对于高流量的网站来说是绝对关键的。可以对这两种技术的性能特征加以比较。这可能会要求开发 Canvas 没有附带的辅助功能、自定义样式以及更粒度化的用户交互功能。虽然 Canvas 通常被视为具有高性能，但是并不意味着它就是明显的选择。下图显示了 SVG 对象和 Canvas 对象之间在呈现时间上的差异。

一般情况下，随着屏幕大小的增大，画布将开始降级，因为需要绘制更多的像素。随着屏幕上的对象数目增多，SVG 将开始降级，因为我们正不断将这些对象添加到 DOM 中。这些度量不一定准确，以下方面的不同一定会引起变化：实现和平台、是否使用完全硬件加速的图形，以及 JavaScript 引擎的速度。

高保真度的复杂矢量文档
高保真度的复杂矢量文档已经成为并将继续成为 SVG 的最有效点，原因主要有两个。存在足够多的极为详细的文档，包括由 CAD 程序生成的那些文档，针对这些文档，SVG 的 scalable 部分提供了独立文档形式或嵌入网页中的文档形式的详细视图。通过该技术还可以进行高保真打印。SVG 的声明性性质向工具、客户端或服务器端提供从数据库生成形状的能力。 最后，我们看到了政府机构的发展，因工程图（为了专利）或工业图（为了城市规划目的）缘故从建议支持转变为对 SVG 的必需支持。这种转变还将继续，因为对于公众使用的电子文档（如下），政府部门越来越不是只喜欢一家供应商：

* 建筑图、工程图和楼层图
* 电子图、航空图和示意图
* 组织结构图
* 地图
* 生物图


以下各图显示了前一方案中可以保留的详细信息示例。第一个图像显示可以在测试驱动网站上找到的网页快照。它包含呼吸系统图和元素周期表。
![](https://static.fredliang.cn/2018-01-02-15011820047645.png)
第二个图像显示同一张图放大 1000% 后的效果
![](https://static.fredliang.cn/2018-01-02-15011820203663.png)
尽管考虑到观察大的示意图的有用性，但在需要细化到细节处时或者出于工程目的需要打印整个示意图时，具有可缩放性的 S 将变得足够清晰和有价值。出于这些原因，我们将高保真度的复杂矢量文档放在谱表的远端，接近 SVG，如下图中所示。
![](https://static.fredliang.cn/2018-01-02-15011820371508.png)

这些文档也可以受益于交互性，这是 SVG 使这些方案最适合于保留图形模式的第二方面。


### 增强的 Web 图形

SVG 作为图像格式
SVG 另外还常用于简单图像，无论是应用程序还是网页中的图像，大图像还是小图像。由于 SVG 要加载到 DOM 中，或者创建图像前至少要进行解析，所以性能会稍微有所下降，但相比于呈现网页的成本（大约几毫秒），这种下降是极其微小。
在文件大小方面（为了评估网络流量的目的），下面演示的两个图像是一样的，只差了 1K（SVG 稍微大点，没有压缩）。
![](https://static.fredliang.cn/2018-01-02-15011821131360.png)

与以前一样，因为 SVG 作为图像格式是可缩放的，所以如果开发人员想要以更大的比例使用该图像，或者用户使用高 DPI的屏幕，则可移植网络图形 (PNG) 要么会变得异常，要么需要更大形式的文件来实现保真。

![](https://static.fredliang.cn/2018-01-02-15011821308906.png)


SVG 因此可以充当非常好的图像替换格式，甚至对网页上最简单的图像也是如此。静态 WebApp/网页图像因此落在谱表的 SVG 端。![](https://static.fredliang.cn/2018-01-02-15011821920247.png)



来源:[MSDN: SVG 与 Canvas:如何选择](https://msdn.microsoft.com/library/gg193983(v=vs.85).aspx)

### 2015 OpenVis会议

![](https://static.fredliang.cn/2018-01-02-15011830576147.png)
如果浏览器载入速度不在考虑范围之内，SVG 绘图是最优的模式。

SVG 生成矢量图，并且和浏览器 DOM 的完全融合，这使它支持最灵活的交互效果和 CSS 样式。但是也正是因为每一个 SVG 元素都是一个 DOM 元素，绘制或移动一个 SVG 元素，浏览器都需要重新绘制、渲染页面，导致速度变慢，性能变差。要保证在浏览器绘制 SVG 过程中无时滞，一个页面静态 SVG 元素大约可以绘制一万个，动态的 SVG 元素，就最好不要超过一千个。

如果你需要一次绘制一千个以上的图形并让他们动起来，或者你需要你的图形做一些特殊的动画效果，这时候 Canvas 就有 SVG 所没有的优势了。

与 SVG 绘图不同的是，Canvas 内绘制的元素都是`预先生成`，预先定下元素特性，预先写好动画路径。使用 Canvas 绘图，你需要写下每一个元素的输出的轨迹。由于 Canvas内绘制的元素并不涉及 DOM 元素，和 SVG 绘制的元素相比，交互性差，但也正因如此，在元素自身的动画特效上不受 DOM 位置限制，能够绘制表现力更强的图形，同时 SVG 生成位图，在浏览器性能（载入速度）上比 SVG 更佳。

与 Canvas 和 SVG 不同的是，WebGL 通过 WebGL JS API 连接 Javascript 和 GPU 编译程序。GPU 绘图的渲染大部分在 GPU 上进行，对浏览器压力减小，性能几个量级地提高，使 WebGL 成为浏览器内的3D渲染、大数据可视化唯一的选择。

如果想使用 WebGL，Baur 还推荐了两个库 pixie.js (2D webGL renderer with canvas fallback), three.js (3D)。不使用库想用的 WebGL 画一个方块就要写200行代码，相比 canvas, SVG，效率极低，绝不建议实际项目中尝试。

根据 MSDN 以及 OpenVis会议 相关介绍，Canvas 对于小范围、位图、表现力强的图形支持要好很多，并且在动态的图像渲染上有更大优势

而 SVG 则对于大范围、静态的矢量图形的支持更好

## WebGl
移动端浏览器支持情况

| 浏览器                      | 情况                                                                                                                                                                                           |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Google Chrome               | WebGL is fully supported.                                                                                                                                                                      |
| Mozilla Firefox             | WebGL is fully supported.                                                                                                                                                                      |
| Apple Safari                | WebGL is fully supported, but must be enabled by the end user. Apple will soon finish its testing of WebGL in Safari, and at that time, I would presume that WebGL will be enabled by default. |
| Opera                       | WebGL will be fully supported starting with Opera 12. You can obtain an alpha build here.                                                                                                      |
| Microsoft Internet Explorer | Currently, this is the only contender that is not yet supporting WebGL, but you can use the Google Chrome Frame plugin to add support for WebGL.                                               |
| iOS Mobile Safari           | WebGL is fully supported, but currently only for iAd customers. We expect WebGL to be fully enabled to all users at the same time that Apple enables it in desktop Safari.                     |
| Android Browser             | WebGL is fully supported on devices from some vendors, although it is likely coming to all devices in the near future.                                                                         |
| Firefox Mobile for Android  | WebGL is fully supported. However, device compatibility may be an issue.                                                                                                                       |
![屏幕快照 2017-07-28 上午10.13.10](https://static.fredliang.cn/2018-01-02-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202017-07-28%20%E4%B8%8A%E5%8D%8810.13.10.png)
[图片来源:caniuse](http://caniuse.com/#feat=webgl)

webgl 定位是 Method of generating dynamic 3D graphics using JavaScript, accelerated through hardware

更多是偏向 3D 渲染加速，并不适合当前使用场景


## mp4

对于微信，视频无法自动播放，需要引导用户点击来实现播放
并且 Mp4还涉及到视频文件大小，是下下之策。

## gif

gif 每帧以 png 进行渲染，以现在的手机渲染性能还有明显卡顿，效果很差。

# 分析
目前来说，优先考虑使用矢量图形替换 png 位图，降低渲染成本
其次在矢量图的基础上尝试比较 Canvas 和 SVG 的渲染效率。并且 Canvas 渲染导致的的边缘锯齿以及大部分手机没有 GPU 供 Canvas 加速使用仍是重要的考虑因素。

# 对接

目前设计师主要是通过 AI 做出单层图形，通过 AE 进行动效制作。
在 AI 和 AE 合作上矢量图形很难对接。使用 png 导入 AE 进行制作。

这样直接导致之前 所说的“假”矢量图,动画通过 SVG 实现，实际的渲染元素还是位图。

所以说渲染瓶颈主要问题在于 AI 与 AE 的矢量图形合作上

#### 首先尝试直接通过 AI 导出矢量图形给 AE
Google 到以下答案
https://forums.adobe.com/thread/2144164
>SVG for the most part is an HTML description of a graphic. It's not vectors, it's not pixels so it's not surprising to me that the AE team has not spent much time implementing that format while they are completely rewriting the rendering pipeline. I'd much rather have faster renders than SVG support at this time.

也就是说 AE 并没有针对偏向 Web 的 SVG 做过支持。
这条路走不通

#### 然后继续 Google
https://www.shutterstock.com/blog/importing-illustrator-files-into-after-effects
https://www.youtube.com/watch?v=RrqR3DEPb4Q
这个介绍了 一种将图形导入 AE 的方案
//还未尝试

##### 后来仔细看了一下 bodymovin 的 wiki
https://github.com/bodymovin/bodymovin/wiki

| Feature        | svg     | canvas  | html    |
| -------------- | ------- | ------- | ------- |
| precomps       | yes     | yes     | yes     |
| solids         | yes     | yes     | yes     |
| images         | yes     | yes     | yes     |
| shapes         | yes     | yes     | yes     |
| trim paths     | yes     | yes     | yes     |
| dashes         | yes     | yes     | yes     |
| time remapping | yes     | yes     | yes     |
| additive masks | yes     | yes     | yes     |
| other masks    | partial | partial | partial |
| expanded masks | yes     | no      | no      |
| track matte    | yes     | no      | no      |
| text as font   | yes     | no      | yes     |
| text as glyphs | yes     | yes     | yes     |
| text animators | yes     | yes     | yes     |
| expressions    | partial | partial | partial |
| 3d layers      | no      | no      | yes     |
| blend modes    | yes*    | yes     | yes     |

\* Except IE and Edge

实际上也可以在 ae 里面绘制图形，目前需要的动画效果基本上都受到支持了。

最终是在 AE 里面以 hack 的形式把所有位图转换成图形

