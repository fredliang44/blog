---
author: "Fred Liang"
categories: ["Product Manager", "Machine Learning", "Work"]
date: 2018-02-09T09:23:47Z
description: "语音交互界面（Voice User Interface，VUI）、手势、动作、表情交互，甚至脑机接口，都属于`自然用户界面`（NUI）。"
draft: false
image: "/images/2018/02/VUI-squashed-1.jpg"
slug: "vui"
tags: ["Product Manager", "Machine Learning", "Work"]
title: "VUI (语音交互)"

---

语音交互界面（Voice User Interface，VUI）、手势、动作、表情交互，甚至脑机接口，都属于`自然用户界面`（NUI）。



# 一.DuerOS 相关
---
> DuerOS 是一个对话式人工智能操作系统，为相关语音交互设备提供一个解决方案，类似于最佳实践。

一开始还是以为 TO C ，后来意识到是 TO B 的。

## 1.模式

可以将常用的语音助手处理模式进行一个简化。

- 语音识别：语音到文字
- 自然语言处理对接服务：根据关键词/语句交付给不同承接服务
- 反馈用户处理结果：反馈语音执行结果

整体的模式其实不是很复杂。

但是 DuerOS 作为一个"系统"级别的基础设施，基于语音输入，兼容多种输入方式，包括视觉，触觉等。也就意味着处理模式的复杂度大大提升。

## 2.组成
DuerOS 分为：核心接入组件、开发套件、参考设计三层

![Duer 模式示意图](https://storage.fredliang.cn/web/20171219102207646.png)

### 核心接入组件

**核心接入组件分为“系统唤醒”和“SDK 层”。**

系统唤醒主要是唤醒语音助手。
SDK 层主要是不同系统环境接入，正在认证 DuerOS 的开发者，后期可以试一下。

核心接入组件以软件为主。

### 开发套件

**开发套件包括芯片模组和麦克风阵列。**
以硬件为主。

### 参考设计

**参考设计是以工业设计为主，包括ID工业设计，MD 结构设计以及音腔设计。**
偏向硬件设计。

## 3.承接业务

**个人把后面的承接业务分为三类，首先是IOT，其次是软件服务类，最后是对话类。**

### IOT 类服务

因为 IOT 类服务的触发模式是非常确定的，完全可以给出一个触发的模板来触发 IOT 设备的动作。

比如“打开电视机”，“在明早8点打开空调”等。

### 软件服务类

将现有服务提供一个新的语音接口。

例如“购买一包薯片”，“打车到三里屯”等
其实就是将语音对接到商城以及打车服务的接口进行后续操作，将操作对接到语音交互上面。

### 对话类

对话类是对于语音服务的技术性要求最高的，也就是说对话机器人需要回答`开放式`的问题。


# 二.VUI
---

## 1.定义


根据Amazon Alexa的解释

> A voice user interface (VUI) allows people to use voice input to control computers and devices. In short, it’s what enables voice experiences like the Star Trek computer and Alexa, Amazon’s voice service and the brain behind millions of devices including the Amazon Echo. Voice experiences are great when they offer a faster, easier, or more delightful way of doing things.

认为语音用户界面（VUI）允许用户使用语音输入来控制计算机和设备。 

## 2.为什么 VUI 使用越来越广泛

![line chart of usage](https://storage.fredliang.cn/web/ui-of-the-now._CB530378693_.png)

在最近的几十年，我们可以看到几次人机交互的巨大变革，并且迅速被大众所接受。

从键盘，到点击，到拖拽，到多点触控。

每次变革，都带来了更高效的交互模式以及更低的使用门槛，从而极大了拓展了计算机的使用场景。

## 3.VUI 落地的催化剂

1. `Web 服务以及 IoT 设备的丰富。`Web 服务提供了丰富的语音交互服务应用场景，而物联网设备则提供了无数新的感知维度的数据。
2. `硬件设备的能力`，目前的语音设备已经可以提供远场语音处理(FFVIP, far-field voice input processing)。允许人们将语音作为一个辅助输入方式。
3. `机器学习等领域的发展`自然语言理解（NLU），语音识别（ASR， Automatic Speech Recognition），语音合成（TTS，Text To Speech）相关领域发展为语音交互奠定了基础。


## 4.VUI 的优势

==高效的交互方式就是好的交互方式。==

| 交互方式 | 速度 | 准确度 | 负荷 | 感官维度   | 效率 | 学习成本 |
| -------- | ---- | ------ | ---- | ---------- | ---- | -------- |
| 键盘     | 慢   | 高     | 高   | 视觉，触觉 | 低   | 高       |
| 触控     | 中   | 中     | 中   | 视觉，触觉 | 中   | 中       |
| 语音     | 快   | 低     | 低   | 听觉       | 高   | 低       |

## 5.VUI 目前的问题
### 1) 远场识别
* 多通道同步采集硬件研发
* 前端麦克风阵列降噪算法
* 后端语音识别与前端信号处理算法的匹配

