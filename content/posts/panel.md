+++
author = "Fred Liang"
categories = ["Product Manager", "Unique Studio", "Design", "Web", "Python", "Work"]
date = 2018-01-02T05:52:00Z
description = "Panel 是一个移动端 APP，提供云服务器以及容器管理服务，用户可以快速地通过 Panel 创建，启动，停止，销毁云服务器和容器。"
draft = false
image = "https://statics.fredliang.cn/photo-1501772529219-ed0014f5032c?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&s=187d9cca52432a4147c14bec0af9eba7"
slug = "panel"
tags = ["Product Manager", "Unique Studio", "Design", "Web", "Python", "Work"]
title = "Panel"

+++

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Panel 简介](#panel-简介)
	- [优点](#优点)
	- [主要模块](#主要模块)
		- [服务器(Instances)](#服务器instances)
			- [服务器的基础操作：](#服务器的基础操作)
			- [服务器的状态监控：](#服务器的状态监控)
			- [服务器 SHELL:](#服务器-shell)
			- [不同 IDC 之间的索引](#不同-idc-之间的索引)
		- [容器服务(Services)](#容器服务services)
			- [容器服务编排](#容器服务编排)
			- [容器(服务)的基础操作：](#容器服务的基础操作)
			- [容器（服务）的配置](#容器服务的配置)
			- [Webhook触发](#webhook触发)
		- [云应用服务(Application)](#云应用服务application)
		- [设置](#设置)

<!-- /TOC -->

# Panel 简介


一句话描述：Panel 是一个移动端 APP，提供云服务器以及容器管理服务，用户可以快速地通过 Panel 创建，启动，停止，销毁云服务器和容器。

## 优点

1. 可一键部署复杂应用
2. 移动端快速从公有云服务商创建服务器并部署自己的服务
3. 容器灵活伸缩，具有高可用性
4. 便捷的创建，启动，停止，销毁服务
5. 有自己的“应用商店”，方便直接从模板创建
6. 可以事实通过邮件，短信提醒用户服务状态
7. 支持多个公有云平台，方便服务对接

## 主要模块

### 服务器(Instances)
---
#### 服务器的基础操作：

1. 创建
2. 启动
3. 停止
4. 销毁

#### 服务器的状态监控：

1. CPU 使用率
2. 内存使用率
3. 磁盘读写
4. 磁盘使用率

#### 服务器 SHELL:

* 用户可以选择把密钥保存在服务器上或者自己本地 APP 里面
手机 SHELL 登录入口

#### 不同 IDC 之间的索引

1. 服务商
2. 地域
3. 查询

### 容器服务(Services)
---
#### 容器服务编排

1. 通过 docker-compose 构建服务

#### 容器(服务)的基础操作：

1. 容器编排
2. 服务创建
3. 服务/容器启动
4. 服务/容器停止
5. 服务/容器销毁

#### 容器（服务）的配置

1. 附加命令
2. 挂载目录
3. 端口映射
4. 伸缩条件
5. 内网搭建（待选）

#### Webhook触发

1. 触发容器更新
2. 触发容器伸缩

### 云应用服务(Application)
---
1. 应用模板编排
2. 应用简易定制
3. 一键部署

### 设置
---
1. 用户个人信息
2. 密钥保管
3. 外观设置
4. 应用信息

