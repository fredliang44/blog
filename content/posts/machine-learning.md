---
author: "Fred Liang"
categories: ["Machine Learning", "Technology"]
date: 2018-01-01T07:40:59Z
description: "Andrew Ng Cousera ??????????"
draft: false
image: "https://images.fredliang.cn/photo-1485795959911-ea5ebf41b6ae?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&s=1afe017e8ef1c307694e80bcb95fc24d"
slug: "machine-learning"
tags: ["Machine Learning", "Technology"]
title: "Machine Learning"
---

{{% mathjax %}}

# Week 1

## What is Machine Learning?

Two definitions of Machine Learning are offered. Arthur Samuel described it as: "the field of study that gives computers the ability to learn without being explicitly programmed." This is an older, informal definition.

Tom Mitchell provides a more modern definition: "A computer program is said to learn from experience E with respect to some class of tasks T and performance measure P, if its performance at tasks in T, as measured by P, improves with experience E."

Example: playing checkers.

E = the experience of playing many games of checkers(玩很多棋子的经验)

T = the task of playing checkers.（玩跳棋的任务）

P = the probability that the program will win the next game.（程序赢得比赛的概率）

In general, any machine learning problem can be assigned to one of two broad classifications:（两个分类）

**Supervised learning** (监督学习)and **Unsupervised**(非监督学习) learning.

#### Unsupervised learning

#### Supervised learning

##### Regression problem（回归问题）

预测出准确输出值

##### Classification problem (分类问题)

确定离散输出（0/1）

#### Useful variables

**m** = Number of training examples（训练样本数量）
**x**'s = "input" variable / feature （输入变量）
**y**'s = "ouput" variable / "target" variable （输出变量）
**h** = hypothesis (假设，表示一个函数，拟合输入与输出对应的关系)
hθ(x)=θ0+θ1\*x
![](https://static.fredliang.cn/2018-01-01-14955548058951.png)

#### Cost function（代价函数,或平方误差函数）

线性回归的假设很简单，一元线性回归是二维平面的直线方程，多元线性回归则是多维空间中的平面（或者超平面）：

<p>
$$ \theta_0+\theta_1x_1+\theta_2x_2+\cdots+\theta_nx_n = h_\theta(x^{(i)})$$
</p>

其中，θ0θ0 的系数为 1，即 x0x0 为 1，写成向量形式如下：
$$\theta^TX = h_\theta(x^{(i)})$$
其中：

<p>
$X=\begin{bmatrix}x_0\\x_1\\x_2\\\cdots\\x_n\end{bmatrix}\theta=\begin{bmatrix}\theta_0\\ \theta_1\\ \theta_2\\ \cdots\\ \theta_n\end{bmatrix}$
</p>

把 m 个训练实例(Example)的变量 X 列成一个维度为 m\*(n+1)的矩阵：

<p>
$X=\begin{bmatrix} 1 & x^{(1)}_1 & x^{(1)}_2 & \cdots & x^{(1)}_n \\ 1 & x^{(2)}_1 & x^{(2)}_2 & \cdots & x^{(2)}_n \\ \vdots & \vdots & \vdots & x_j^{(i)} & \vdots \\ 1 & x^{(m)}_1 & x^{(m)}_2 & \cdots & x^{(m)}_n \\ \end{bmatrix}_{m\times (n+1)} =\begin{bmatrix} x^{(1)}\\x^{(2)}\\\vdots\\x^{(m)} \end{bmatrix}_{m\times1} =\begin{bmatrix} x_0&x_1&x_2&\cdots&x_n \end{bmatrix}_{1\times (n+1)}$
</p>

其中每行 $x^{(i)}$ 对应一个训练实例，每列$x_j$是一个特征(Feature)，X 的元素即第 i 个训练实例的第 j 个特征，可以表示为: $x^{(i)}_j$

而假设可以进一步简写为：

<p>
$$X\theta =\begin{bmatrix}h_\theta(x^{(1)})\\ h_\theta(x^{(2)})\\\cdots\\h_\theta(x^{(m)})\\\end{bmatrix}= h_\theta(X)$$
</p>

代价函数;

<p>
$$J(\theta)=\frac{1}{2m}\sum_{i=1}^m{(h_\theta(x^{(i)})-y^{(i)})^2}$$
</p>

但是，要注意的就是代价函数不总是平方和，在后面的学习中还会接触到其他形式的代价函数。

在线性回归中，将 m 个误差组成一个列向量为：

<p>  
$$E=\begin{bmatrix}h_\theta(x^{(1)})-y^{(1)}\\ h_\theta(x^{(2)})-y^{(2)} \\\cdots\\h_\theta(x^{(m)})-y^{(m)} \\\end{bmatrix}$$
</p>

E 为可以理解为误差向量，就是每个预测结果 hθ(x(i))hθ(x(i))和对应的 y(i)y(i)之间的误差组成的列向量。注意到假设的矩阵表示形式（1.1 最后一个公式），则有：
$$E=X\theta-y$$
上述代价函数用矩阵表示，就是：

<p>
$$J(\theta)=\frac{1}{2m}E^T E=\frac{1}{2m}(X\theta-y)^T(X\theta-y)$$
</p>

θ0 和 θ1 called parameters of the model（模型参数）

![屏幕快照 2017-05-31 下午1.58.04](https://static.fredliang.cn/2018-01-01-屏幕快照%202017-05-31%20下午1.58.04.png)

We can measure the accuracy of our hypothesis function by using a cost function. This takes an average difference (actually a fancier version of an average) of all the results of the hypothesis with inputs from x's and the actual output y's.

![屏幕快照 2017-05-31 下午2.01.05](https://static.fredliang.cn/2018-01-01-屏幕快照%202017-05-31%20下午2.01.05.png)
To break it apart, it is 12 x¯ where x¯ is the mean of the squares of hθ(xi)−yi , or the difference between the predicted value and the actual value.

This function is otherwise called the "Squared error function", or "Mean squared error". The mean is halved (12) as a convenience for the computation of the gradient descent, as the derivative term of the square function will cancel out the 12 term. The following image summarizes what the cost function does:

##### Hθ(x)假设函数，J(θ1)代价函数

If we try to think of it in visual terms, our training data set is scattered on the x-y plane. We are trying to make a straight line (defined by hθ(x)) which passes through these scattered data points.

Our objective is to get the best possible line. The best possible line will be such so that the average squared vertical distances of the scattered points from the line will be the least. Ideally, the line should pass through all the points of our training data set. In such a case, the value of J(θ0,θ1) will be 0. The following example shows the ideal situation where we have a cost function of 0.
![](https://static.fredliang.cn/2018-01-01-14962294441721.png)

When θ1=1, we get a slope of 1 which goes through every single data point in our model. Conversely, when θ1=0.5, we see the vertical distance from our fit to the data points increase.
![](https://static.fredliang.cn/2018-01-01-14962294540322.png)

This increases our cost function to 0.58. Plotting several other points yields to the following graph:
![](https://static.fredliang.cn/2018-01-01-14962295162166.png)

Thus as a goal, we should try to minimize the cost function. In this case, θ1=1 is our global minimum.

##### contour plots / contour figures（轮廓图）

A contour plot is a graph that contains many contour lines. A contour line of a two variable function has a constant value at all points of the same line. An example of such a graph is the one to the right below.
![](https://static.fredliang.cn/2018-01-01-14962303651727.png)

Taking any color and going along the 'circle', one would expect to get the same value of the cost function. For example, the three green points found on the green line above have the same value for J(θ0,θ1) and as a result, they are found along the same line. The circled x displays the value of the cost function for the graph on the left when θ0 = 800 and θ1= -0.15. Taking another h(x) and plotting its contour plot, one gets the following graphs:
![](https://static.fredliang.cn/2018-01-01-14962303738703.png)

When θ0 = 360 and θ1 = 0, the value of J(θ0,θ1) in the contour plot gets closer to the center thus reducing the cost function error. Now giving our hypothesis function a slightly positive slope results in a better fit of the data.

![](https://static.fredliang.cn/2018-01-01-14962303849220.png)

The graph above minimizes the cost function as much as possible and consequently, the result of θ1 and θ0 tend to be around 0.12 and 250 respectively. Plotting those values on our graph to the right seems to put our point in the center of the inner most 'circle'.

#### gradient descent (梯度下降)

数学上，函数 f(x,y,z)（讨论 3 元函数不失一般性）的梯度是一个向量，它指向函数值变化最快的方向，它的模就是方向导数的最大值。首先引入所谓梯度算子(operator)：

<p>
$$\nabla = \langle\frac{\partial }{\partial x},\frac{\partial }{\partial y},\frac{\partial }{\partial z}\rangle$$
</p>

形式上来看它是一个向量，但本身不是向量，也不是任何数量。它本质是一个运算符，和加减乘除（+-\*/）是同类东西，只不过它是“一元”运算符，作用于某个函数 f 就能到一个向量，因为相当于两边乘了 f 这个“数”，这个向量就是梯度：

<p>
$$\nabla f= \langle\frac{\partial f}{\partial x},\frac{\partial f}{\partial y},\frac{\partial f}{\partial z}\rangle$$
</p>

梯度下降是一种优化方法，其思想是函数梯度最小时一定是该函数的一个局部极小值。梯度下降的公式为：

<p>
$$\theta_j\ := \theta_j - \alpha\frac{\partial}{\partial\theta_j}J(\theta)$$
</p>

上式右侧的偏导数其实就是代价函数梯度的第 j 个分量，也就是：

<p>
$$\frac{\partial }{\partial\theta_j}J(\theta)=\frac{1}{m}\sum_{i=1}^m{(h_\theta^{x(i)}-y^{(i)})x_j^{(i)}}$$
</p>

需要注意的是，这里的 αα 是学习速率(Learning Rate)，它控制了算法收敛的速度，以及是否能够收敛。αα 越大则 θθ 减小越快，越容易收敛，但太大的话会超出(overshoot)目标最小值，反而会发散。

代价函数的梯度写成矩阵形式为：

<p>
$$\frac{\partial }{\partial\theta}J(\theta)=\frac{1}{m}X^T E$$
</p>

因此，求回归参数 θ 的公式为：

<p>
$$ \theta\ := \theta - \alpha\frac{1}{m}X^T E$$
</p>

local optimum (局部最优解)

So we have our hypothesis function and we have a way of measuring how well it fits into the data. Now we need to estimate the parameters in the hypothesis function. That's where gradient descent comes in.

Imagine that we graph our hypothesis function based on its fields θ0 and θ1 (actually we are graphing the cost function as a function of the parameter estimates). We are not graphing x and y itself, but the parameter range of our hypothesis function and the cost resulting from selecting a particular set of parameters.

We put θ0 on the x axis and θ1 on the y axis, with the cost function on the vertical z axis. The points on our graph will be the result of the cost function using our hypothesis with those specific theta parameters. The graph below depicts such a setup.
![](https://static.fredliang.cn/2018-01-01-14962964483127.png)

We will know that we have succeeded when our cost function is at the very bottom of the pits in our graph, i.e. when its value is the minimum. The red arrows show the minimum points in the graph.

The way we do this is by taking the derivative (the tangential line to a function) of our cost function. The slope of the tangent is the derivative at that point and it will give us a direction to move towards. We make steps down the cost function in the direction with the steepest descent. The size of each step is determined by the parameter α, which is called the learning rate.

For example, the distance between each 'star' in the graph above represents a step determined by our parameter α. A smaller α would result in a smaller step and a larger α results in a larger step. The direction in which the step is taken is determined by the partial derivative of J(θ0,θ1). Depending on where one starts on the graph, one could end up at different points. The image above shows us two different starting points that end up in two different places.

The gradient descent algorithm is:

repeat until convergence:

θj:=θj−α∂∂θjJ(θ0,θ1)
where

j=0,1 represents the feature index number.

At each iteration j, one should simultaneously update the parameters θ1,θ2,...,θn. Updating a specific parameter prior to calculating another one on the j(th) iteration would yield to a wrong implementation.

![](https://static.fredliang.cn/2018-01-01-14962964579620.png)
**alpha is called Learning Rate(学习速率)，控制逐次下降的幅度**
**偏导数项**

#### Gradient Descent Intuition

In this video we explored the scenario where we used one parameter θ1 and plotted its cost function to implement a gradient descent. Our formula for a single parameter was :

Repeat until convergence:
![屏幕快照 2017-06-01 下午2.11.43](https://static.fredliang.cn/2018-01-01-屏幕快照%202017-06-01%20下午2.11.43.png)

Regardless of the slope's sign for ddθ1J(θ1), θ1 eventually converges to its minimum value. The following graph shows that when the slope is negative, the value of θ1 increases and when it is positive, the value of θ1 decreases.
![](https://static.fredliang.cn/2018-01-01-14962975575471.png)
On a side note, we should adjust our parameter α to ensure that the gradient descent algorithm converges in a reasonable time. Failure to converge or too much time to obtain the minimum value imply that our step size is wrong.

![](https://static.fredliang.cn/2018-01-01-14962975768255.png)
On a side note, we should adjust our parameter α to ensure that the gradient descent algorithm converges in a reasonable time. Failure to converge or too much time to obtain the minimum value imply that our step size is wrong.

θ1:=θ1−α∗0
![](https://static.fredliang.cn/2018-01-01-14962976021394.png)

#### Gradient Descent For Linear Regression

When specifically applied to the case of linear regression, a new form of the gradient descent equation can be derived. We can substitute our actual cost function and our actual hypothesis function and modify the equation to :
![屏幕快照 2017-06-01 下午2.23.50](https://static.fredliang.cn/2018-01-01-屏幕快照%202017-06-01%20下午2.23.50.png)
where m is the size of the training set, θ0 a constant that will be changing simultaneously with θ1 and xi,yiare values of the given training set (data).

Note that we have separated out the two cases for θj into separate equations for θ0 and θ1; and that for θ1 we are multiplying xi at the end due to the derivative. The following is a derivation of ∂∂θjJ(θ) for a single example :![](https://static.fredliang.cn/2018-01-01-14962982643066.png)

$$∇_𝜃𝐽(θ)= 𝑋^𝑇𝑋𝜃 − 𝑋^𝑇𝑌$$

The point of all this is that if we start with a guess for our hypothesis and then repeatedly apply these gradient descent equations, our hypothesis will become more and more accurate.

So, this is simply gradient descent on the original cost function J. This method looks at every example in the entire training set on every step, and is called batch gradient descent. Note that, while gradient descent can be susceptible to local minima in general, the optimization problem we have posed here for linear regression has only one global, and no other local, optima; thus gradient descent always converges (assuming the learning rate α is not too large) to the global minimum. Indeed, J is a convex quadratic function. Here is an example of gradient descent as it is run to minimize a quadratic function.

![](https://static.fredliang.cn/2018-01-01-14962982756816.png)
The ellipses shown above are the contours of a quadratic function. Also shown is the trajectory taken by gradient descent, which was initialized at (48,30). The x’s in the figure (joined by straight lines) mark the successive values of θ that gradient descent went through as it converged to its minimum.

### Linear algebra review(线代复习)

matrix 矩阵
dimension of matrix 纬度
2 by 3 matrix == 2 X 3 矩阵

# Week 2

## Multiple Variables

![屏幕快照 2017-08-09 下午7.09.16](https://static.fredliang.cn/2018-01-01-屏幕快照%202017-08-09%20下午7.09.16.png)

hθ(x)==θ^T x

### Feature Scaling(特征缩放)

将 X<sub>1</sub> X<sub>2</sub>……缩放到取值范围接近
大约在-1 $ \leq x_i \leq $ 1 之间即可

-3 $ \leq x_i \leq $ 3 基本上可以
$ -\frac{1}{3} \leq x_i \leq \frac{1}{3}$ 也是可以接受的范围

#### Mean Normalization(均值归一化)

取代$ x_i $为$ x_i - \mu_i$使均值接近 0

一般使用$\frac{x_i - \mu_i}{s_i} $来进行均值归一化，$ s _ i $为$ x_i$最大值减去最小值，$ \mu_i$是平均值

### Learning Rate

如何确定梯度下降正确运行

如何选择学习速率$ \alpha $

If α is too small: slow convergence.

If α is too large: may not decrease on every iteration and thus may not converge.

### Features and Polynomial Regression(多项式回归)

假设模型为
$ h_\theta(x) = \theta_0 + \theta_1(\text{size}) + \theta_2\sqrt{(\text{size})} $
size 范围为 1-1000 拟合模型
$ h_\theta(x) = \theta_0 + \theta_1x_1 + \theta_2x_2 $
最后通过特征缩放(没有进行均值归一化)
会选择哪个$ x_1 $和 $ x_2 $？($\sqrt{1000} \approx 32 $)

$ x_1 = \frac{\text{size}}{1000},\ x_2 = \frac{\sqrt{(\text{size})}}{32} $

要是线性预测函数不能很好的拟合数据，我们可以通过开方，二次，三次函数改变预测函数的行为或者曲线

例如，如果预测函数为$h_\theta(x) = \theta_0 + \theta_1 x_1$
然后我们可以增加基于$x_1$的特征，来获得二次函数$h_\theta(x) = \theta_0 + \theta_1 x_1 + \theta_2 x_1^2$  或者三次函数$h_\theta(x) = \theta_0 + \theta_1 x_1 + \theta_2 x_1^2 + \theta_3 x_1^3$

在二次函数中，我们建立了新的特征$x_2$和$x_3$并且$x_2=x_1^2,x_3=x_1^3$

为了获得开方函数，我们可以$h_\theta(x) = \theta_0 + \theta_1 x_1 + \theta_2 \sqrt{x_1}$

例如$x_1$范围是 1-1000，$x_2$范围是 1-1000000，$x_3$范围是 1-1000000000

`如果这样处理，同时缩放特征值范围很重要`

## Normal Equation 正规方程

在向量各个方向求偏导，让各个方向的偏导数为 0

<p>
$$X^T X\theta=X^T y$$
$$\theta = (X^T X)^{-1}X^T y$$
</p>

| Gradient Descent      | Normal Equation            |
| --------------------- | -------------------------- |
| 需要去选择下降速率    | 不需要去选择下降速率       |
| 需要许多迭代          | 不需要许多迭代             |
| O (kn2)               | O (n3), 需要计算$X^TX$的逆 |
| 当 n 很大的时候更有效 | 当 n 比较小的时候更有效    |

n$ \leq $10000 说明 n 相对较小，可以使用正规方程
若 n$\geq$10000 建议使用梯度下降，速度比较快

### 正规方程以及它的不可逆性

如果$X^TX$是不可逆的，一般有以下几种情况: 1.特征冗余，两个特征相关性非常强 2.过多的特征(如:m<n)，删除一些特征，或者使用"regularization(转正)"，在后面会讲

# Week 3

## 局部加权回归(Lost)

## 最小二乘法的概率解释(Lost)

## Classification 逻辑回归

### hypothesis representation 假设函数表达式

当目标假设是线性模型时，使用线 性回归自然能拟合的很好，但如果目标假设不是线性模型，比如一个忽上忽下的 的函数，这时用线性模型就拟合的很差。

Our new form uses the "Sigmoid Function," also called the "Logistic Function":
双曲函数也叫 Logistic 函数

<p>
$$\begin{align*}& h_\theta (x) = g ( \theta^T x ) \newline \newline& z = \theta^T x \newline& g(z) = \dfrac{1}{1 + e^{-z}}\end{align*}$$
</p>

$g (z ) $函数看起来是
![](https://static.fredliang.cn/2018-01-01-15025256570088.png)
这里所示的函数$g (z ) $将任何实数映射到（0,1）间隔，使得将任意值函数变换成更适合于分类的函数是有用的。

<p>
$$\begin{align*}& h_\theta(x) = P(y=1 | x ; \theta) = 1 - P(y=0 | x ; \theta) \newline& P(y = 0 | x;\theta) + P(y = 1 | x ; \theta) = 1\end{align*}$$
</p>

$hθ(x)$将给出我们的输出为 1 的概率。例如，$hθ(x)$= 0.7 给出了我们的输出为 1 的 70％的概率。我们的预测为 0 的概率只是我们的 概率为 1（例如，如果为 1 的概率为 70％，则为 0 的概率为 30％）。

###Decision Boundary 决策边界
为了分开 0 和 1，我们可以把输出转义成

<p>
$$\begin{align*}& h_\theta(x) \geq 0.5 \rightarrow y = 1 \newline& h_\theta(x) < 0.5 \rightarrow y = 0 \newline\end{align*}$$
</p>

当$g(z)$的输入值 z 大于 0 时$g(z)\geq 0.5$，即：
$$\begin{align*}& g(z) \geq 0.5 \newline& when \; z \geq 0\end{align*}$$

Tips：

<p>
$$\begin{align*}z=0, e^{0}=1 \Rightarrow g(z)=1/2\newline z \to \infty, e^{-\infty} \to 0 \Rightarrow g(z)=1 \newline z \to -\infty, e^{\infty}\to \infty \Rightarrow g(z)=0 \end{align*}$$
</p>

如果输入是$\theta^T X$，则有:

<p>
$$\begin{align*}& h_\theta(x) = g(\theta^T x) \geq 0.5 \newline& when \; \theta^T x \geq 0\end{align*}$$
</p>

也就意味着:

<p>
$$\begin{align*}& \theta^T x \geq 0 \Rightarrow y = 1 \newline& \theta^T x < 0 \Rightarrow y = 0 \newline\end{align*}$$
</p>

Example:

<p>
$$\begin{align*}& \theta = \begin{bmatrix}5 \newline -1 \newline 0\end{bmatrix} \newline & y = 1 \; if \; 5 + (-1) x_1 + 0 x_2 \geq 0 \newline & 5 - x_1 \geq 0 \newline & - x_1 \geq -5 \newline& x_1 \leq 5 \newline \end{align*}$$
</p>

### Cost Function

线性回归的代价函数会导致输出出现波动，最终梯度下降可能到达一个局部最优解，不是一个凸函数。

最后，代价函数为：

<p>
$$\begin{align*}& J(\theta) = \dfrac{1}{m} \sum_{i=1}^m \mathrm{Cost}(h_\theta(x^{(i)}),y^{(i)}) \newline & \mathrm{Cost}(h_\theta(x),y) = -\log(h_\theta(x)) \; & \text{if y = 1} \newline & \mathrm{Cost}(h_\theta(x),y) = -\log(1-h_\theta(x)) \; & \text{if y = 0}\end{align*}$$
</p>

当 y = 1, 我们我们得到以下关于$J(\theta)$和$h_\theta (x)$的图像
![](https://static.fredliang.cn/2018-01-01-15025394207291.png)

同样的，当 y=1，我们得到以下关于$J(\theta)$和$h_\theta (x)$的图像

![](https://static.fredliang.cn/2018-01-01-15025394875827.png)

<p>
$$\begin{align*}& \mathrm{Cost}(h_\theta(x),y) = 0 \text{ if } h_\theta(x) = y \newline & \mathrm{Cost}(h_\theta(x),y) \rightarrow \infty \text{ if } y = 0 \; \mathrm{and} \; h_\theta(x) \rightarrow 1 \newline & \mathrm{Cost}(h_\theta(x),y) \rightarrow \infty \text{ if } y = 1 \; \mathrm{and} \; h_\theta(x) \rightarrow 0 \newline \end{align*}$$
</p>

如果我们的正确答案'y'为 0，那么如果我们的假设函数也输出 0，则代价函数将为 0。如果我们的假设接近 1，则代价函数将接近无穷大。

如果我们的正确答案'y'为 1，那么如果我们的假设函数输出 1，则代价函数将为 0。如果我们的假设接近 0，则代价函数将接近无穷大。

注意，以这种方式编写代价函数可以保证$J(\theta)$对于逻辑回归是凸函数。

<p>
$$ \mathrm{Cost}(h_\theta(x),y) = - y \; \log(h_\theta(x)) - (1 - y) \log(1 - h_\theta(x))$$
</p>

完整的代价函数

<p>
$$J(\theta) = - \frac{1}{m} \displaystyle \sum_{i=1}^m [y^{(i)}\log (h_\theta (x^{(i)})) + (1 - y^{(i)})\log (1 - h_\theta(x^{(i)}))]$$
</p>
