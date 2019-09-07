+++
author = "Fred Liang"
categories = ["Big Data", "Work"]
date = 2018-12-10T02:02:00Z
description = "Batch：批处理MPP：大规模并行处理Cube：多维立方体Hadoop：是一款支持数据密集型分布式应用程序"
draft = false
image = "https://images.unsplash.com/photo-1526628953301-3e589a6a8b74?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ"
slug = "batch-mpp-cube-he-hadoop"
tags = ["Big Data", "Work"]
title = "Batch、MPP、Cube 和 Hadoop"

+++

Batch：批处理
MPP：大规模并行处理
Cube：多维立方体
Hadoop：是一款支持数据密集型分布式应用程序

## Batch
只关注批处理任务相关的问题，如事务、并发、监控、执行等，并不提供相应的调度功能。因此，如果我们希望批处理任务定期执行，可结合 Quartz 等成熟的调度框架实现。

## MPP
MPP (Massively Parallel Processing)，即大规模并行处理，在数据库非共享集群中，每个节点都有独立的磁盘存储系统和内存系统，业务数据根据数据库模型和应用特点划分到各个节点上，每台数据节点通过专用网络或者商业通用网络互相连接，彼此协同计算，作为整体提供数据库服务。非共享数据库集群有完全的可伸缩性、高可用、高性能、优秀的性价比、资源共享等优势。

简单来说，MPP是将任务并行的分散到多个服务器和节点上，在每个节点上计算完成后，将各自部分的结果汇总在一起得到最终的结果(与Hadoop相似)。

MPP数据库适合存储高密度价值数据，并且是长期存储和多次使用，所以MPP并行数据库会花大量经历在Load阶段，把数据处理成适合分析格式。带来的优点是查询速度快，通常在秒计甚至毫秒级以内就可以返回查询结果。缺点是不支持细粒度的容错，不支持高并发，集群数量扩展有上限，执行引擎和存储紧耦合导致数据难以被其他分析引擎进行分析。

## Cube
cube是一个非常重要的概念，是多维立方体的简称，主要是用于支持联机分析应用（OLAP）,为企业决策提供支持。Cube就像一个坐标系，每一个Dimension代表一个坐标系，要想得到一个一个点，就必须在每一个坐标轴上取得一个值，而这个点就是Cube中的Cell。

## Hadoop
原理更类似batch processing，更细粒度切分task，worker能者多劳（每个worker上执行的任务可以是不平均，不一致的）。单独worker看，性能不及MPP，但是胜在scalability优异，几百个节点是没问题的，在集群性上远胜MPP。


## MPP VS Hadoop
> 原文：<https://www.zhihu.com/question/27589901/answer/52144108>

MPP和SQL on Hadoop的最大区别就在于，MPP架构是Full-SQL compatiable的，实现不局限于将Query分解为一连串的MR job去执行。并且由于每一列的数据类型进行了特定的压缩和编码(比如run-length/delta/bytecoding)，能做的优化要比单纯的MapReduce多很多，效率自然也要高不少。相较于SQL on Hadoop，MPP更适合做interactive ad-hoc analysis，前者则更适用于对于海量数据做批处理或者需要使用UDF(自定义函数)的场景。在Scalability方面，MPP相较Hadoop类系统要差，依赖于定制硬件，而且没有可靠的开源实现。

## SQL on Hadoop

SQL-on-Hadoop架构可以分为两类：

* SQL over Processing Framework：例如SparkSQL，Drill/Datameer，Presto，Impala
* OLAP over Hadoop：例如Kylin，Druid，AtScale，Kyvos

**SQL over Processing Framework**系统的共同特点是“Hadoop通用计算框架+SQL解析引擎”，存储层、执行引擎层、SQL解析层三者分离，可以方便替换执行引擎，对使用者而言，同一份数据可以采用不同并行执行引擎来分析。优点是灵活性高，支持细粒度容错，集群扩展性好，缺点是效率无法保证。

**OLAP over Hadoop**系统的共同特点是预计算，即数据都以时间序列的方式进入系统并经过数据预聚合和建立索引，因为是预计算，所以应对多维查询时速度非常快（计算时间复杂度O(1)）且稳定，支持高并发，支持集群扩展。缺点是灵活性较差。

