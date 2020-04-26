---
author: "Fred Liang"
categories: ["Machine Learning", "Python", "Technology"]
date: 2018-01-03T06:05:02Z
description: "尝试自己造一个轮子，封装出一个常用的机器学习相关工具的库。目前在写可视化，会用到 bokeh 和 polty"
draft: false
image: "https://images.fredliang.cn/reserve/oIpwxeeSPy1cnwYpqJ1w_Dufer%20Collateral%20test.jpg?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&s=a1f7c1b49ae155ee44cc89dc1b1be4a5"
slug: "machine-learning-toolbox"
tags: ["Machine Learning", "Python", "Technology"]
title: "Machine Learning Toolbox"

---

# [ML_Toolbox](https://github.com/fredliang44/ML_Toolbox)

<img src="https://img.shields.io/badge/language-python3.6-5FA8E7.svg?style=flat-square" alt="" style="width: 7em;padding: 0.3em;display: inline;
"><a target="_blank" href="https://codebeat.co/projects/github-com-fredliang44-ml_toolbox-master"><img src="https://img.shields.io/badge/codebeat-A-brightgreen.svg?style=flat-square" alt="" style="display: inline;width: 4.4em;padding: 0 0.3em;
"></a><a target="_blank" href="https://github.com/fredliang44/ML_Toolbox"><img src="https://img.shields.io/badge/github-watch-green.svg?style=social" alt="" style="width: 5.4em;display: inline;padding: 0.3em;"></a>

尝试自己造一个轮子，封装出一个常用的机器学习相关工具的库
目前在写可视化，会用到 bokeh 和 polty

## Visualization
From [bokeh](https://bokeh.pydata.org)

## Example

### Visualization



```python
from ML_Toolbox import vis
x = [0.1, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0]
y = [i**4 for i in x]

chart = vis.Line(x,y)
chart.x_label = "testx"
chart.y_label = "testy"
chart.show()
```

![Line graph](https://img.l-do.cn/line.png-github)

```python
from ML_Toolbox import vis
x1 = list(range(150))
y1 = [i**2 for i in x]
x2 = list(range(150))
y2 = [i**1.5 for i in x]

chart = vis.Dot(x,y,x,[i**1.5 for i in y])
chart.label1 = "testx"
chart.label2 = "testy"
chart.title: "test"
chart.show()
```

![Dot graph](https://img.l-do.cn/dot.png-github)

