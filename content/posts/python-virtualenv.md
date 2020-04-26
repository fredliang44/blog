---
author: "Fred Liang"
categories: ["Python", "Technology"]
date: 2018-01-09T09:12:16Z
description: "最近在写一个网站后台，由于涉及到阿里云的 SDK ，而阿里云在自己的源[(https://mirrors.aliyun.com)](https://mirrors.aliyun.com)上发布的 SDK 要新，因此在设置 Python 的包管理的时候需要注意很多东西。"
draft: false
image: "https://images.fredliang.cn/photo-1473777785975-efb668f9ea99?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ%3D%3D%0A&s=de22be290ca307ac60f123947ebfa90a"
slug: "python-virtualenv"
tags: ["Python", "Technology"]
title: "Python 虚拟环境方案比较"

---

最近在写一个网站后台，由于涉及到阿里云的 SDK ，而阿里云在自己的源[(https://mirrors.aliyun.com)](https://mirrors.aliyun.com)上发布的 SDK 要新，因此在设置 Python 的包管理的时候需要注意很多东西。

同时由于历史遗留问题，flask 使用 pipreqs 生成的 requirements.txt 实际上有很多包都不全。在涉及包相对较少的时候还可以使用自定义的 additional reqs 来设置，但是这样子不是很优雅。因此仔细比较了一下常见的 python 虚拟环境方案。

## 1.Pip
首先要讲讲 pip。Pip 是 python 的包管理工具。
Pip 被用来安装各种包，比如 tensorflow、numpy、pandas 和 jupyter，同时还会自动初一的依赖。
<pre data-user="fredliang" class="command-line language-bash" ><code>
pip install your_favorite_library
</pre></code>



许许多多的 Python 资源都通过 pip 包的形式来传输。有时你会在某个包含 Python 脚本的目录下看到一个 requirement.txt 文件。通常，那个文件描述了当前项目所需的所有 pip 包，通过下面的命令即可将它们都安装到当前目录。
<pre data-user="fredliang" class="command-line language-bash"><code> pip install -r requirements.txt. </pre></code>



作为整个 pip 包生态的一份子，各种各样的版本号、以来信息充斥其中。有时我会针对不同项目使用不同版本的库（pip 包），所以我需要有一种能够针对独立环境配置一组包依赖关系的方式。

## 2.pipenv

最近非常火的 pipenv，它能通过自己的包管理实现版本跟踪，拥有自己的配置文件，每个包都有自己的哈希。

实际使用的时候发现 pipenv 十分慢，尤其是在gitlab ci 构建容器的过程中，原来 1 min可以完成的构建现在可能需要 5 min 左右，而且官方文档很稀少，很多实现需要看源码。

如果不需要频繁测试或者部署的应用 pipenv 应该是一个不错的选择，以下是 pipenv 的一些主要用法。

pipenv 会生成两个文件：`Pipfile` 和 `Pipfile.lock`

`Pipfile`：
<pre data-user="fredliang" class="command-line language-bash" data-output="2-27"><code>cat Pipfile

[[source]]

url = "https://mirrors.aliyun.com/pypi/simple/"
verify_ssl = true
name = "pypi"


[packages]

requests = "*"


[dev-packages]



[requires]

python_version = "3.6"</pre></code>

`Pipfile.lock`：
<pre data-user="fredliang" class="command-line language-bash" data-output="2-80"><code>cat Pipfile.lock 

{
    "_meta": {
        "hash": {
            "sha256": "a0e63f8a0d1e3df046dc19b3ffbaaedfa151afc12af5a5b960ae7393952f8679"
        },
        "host-environment-markers": {
            "implementation_name": "cpython",
            "implementation_version": "3.6.1",
            "os_name": "posix",
            "platform_machine": "x86_64",
            "platform_python_implementation": "CPython",
            "platform_release": "17.4.0",
            "platform_system": "Darwin",
            "platform_version": "Darwin Kernel Version 17.4.0: Sun Dec 17 09:19:54 PST 2017; root:xnu-4570.41.2~1/RELEASE_X86_64",
            "python_full_version": "3.6.1",
            "python_version": "3.6",
            "sys_platform": "darwin"
        },
        "pipfile-spec": 6,
        "requires": {},
        "sources": [
            {
                "name": "pypi",
                "url": "https://pypi.python.org/simple",
                "verify_ssl": true
            }
        ]
    },
    "default": {
        "certifi": {
            "hashes": [
                "sha256:14131608ad2fd56836d33a71ee60fa1c82bc9d2c8d98b7bdbc631fe1b3cd1296",
                "sha256:edbc3f203427eef571f79a7692bb160a2b0f7ccaa31953e99bd17e307cf63f7d"
            ],
            "version": "==2018.1.18"
        },
        "chardet": {
            "hashes": [
                "sha256:fc323ffcaeaed0e0a02bf4d117757b98aed530d9ed4531e3e15460124c106691",
                "sha256:84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
            ],
            "version": "==3.0.4"
        },
        "idna": {
            "hashes": [
                "sha256:8c7309c718f94b3a625cb648ace320157ad16ff131ae0af362c9f21b80ef6ec4",
                "sha256:2c6a5de3089009e3da7c5dde64a141dbc8551d5b7f6cf4ed7c2568d0cc520a8f"
            ],
            "version": "==2.6"
        },
        "requests": {
            "hashes": [
                "sha256:6a1b267aa90cac58ac3a765d067950e7dbbf75b1da07e895d1f594193a40a38b",
                "sha256:9c443e7324ba5b85070c4a818ade28bfabedf16ea10206da1132edaa6dda237e"
            ],
            "version": "==2.18.4"
        },
        "urllib3": {
            "hashes": [
                "sha256:06330f386d6e4b195fbfc736b297f58c5a892e4440e54d294d7004e3a9bbea1b",
                "sha256:cc44da8e1145637334317feebd728bd869a35285b93cbb4cca2577da7e62db4f"
            ],
            "version": "==1.22"
        }
    },
    "develop": {}
}</pre></code>

启动 python3 的虚拟环境

<pre data-user="fredliang" class="command-line language-bash" data-output="2-20"><code>pipenv --three

Creating a virtualenv for this project…
Using /Library/Frameworks/Python.framework/Versions/3.6/bin/python3 to create virtualenv…
⠋Running virtualenv with interpreter /Library/Frameworks/Python.framework/Versions/3.6/bin/python3
Using base prefix '/Library/Frameworks/Python.framework/Versions/3.6'
New python executable in /Users/fredliang/.local/share/virtualenvs/fmt-cPFwS9Ia/bin/python3
Also creating executable in /Users/fredliang/.local/share/virtualenvs/fmt-cPFwS9Ia/bin/python
Installing setuptools, pip, wheel...done.

</pre></code>



初始化（部署）python 包管理（生成相关配置文件）

<pre data-user="fredliang" class="command-line language-bash" ><code>pipenv install</pre></code>


通过 Pipfile 部署环境到系统（根据自动生成的相关配置文件）
<pre data-user="fredliang" class="command-line language-bash" ><code>pipenv install --deploy --system</pre>

</code>


安装 requests 库

<pre data-user="fredliang" class="command-line language-bash"><code>pipenv install requests</pre></code>



删除 requests 库
<pre data-user="fredliang" class="command-line language-bash"><code>pipenv uninstall requests</pre></code>



进入虚拟环境的 shell
<pre data-user="fredliang" class="command-line language-bash"><code>pipenv shell</pre></code>



直接在虚拟环境执行 shell
<pre data-user="fredliang" class="command-line language-bash"><code>pipenv shell run python runserver.py</pre>

</code>


列出包依赖关系

<pre data-user="fredliang" class="command-line language-bash" data-output="2-6"><code>pipenv graph
requests==2.18.4
  - certifi [required: >=2017.4.17, installed: 2017.7.27.1]
  - chardet [required: >=3.0.2,<3.1.0, installed: 3.0.4]
  - idna [required: >=2.5,<2.7, installed: 2.6]
  - urllib3 [required: <1.23,>=1.21.1, installed: 1.22]</pre></code>



生成锁文件
<pre data-user="fredliang" class="command-line language-bash" data-output="2-7"><code>$ pipenv lock
Assuring all dependencies from Pipfile are installed...
Locking [dev-packages] dependencies...
Locking [packages] dependencies...
Note: your project now has only default [packages] installed.
To install [dev-packages], run: $ pipenv install --dev</pre></code>



## 3.Virtualenv

Virtualenv 支持你创建可命名的“虚拟开发环境”，在其中你就能按照单独的习惯安装 pip 包了。
如果你想要针对每个环境独立控制对各类 pip 包的管理，那么这就是一款绝佳的工具比如，你可以为 Web 开发创建独立的环境，定义所需的依赖库，然后为数据相关的开发研究建立截然不同的环境。
这样一来，你再也不用顾虑各种毫无关系的依赖包在开发环境中存在，也可以创建具有专门用途的开发环境。

初始化
<pre data-user="fredliang" class="command-line language-bash"><code>virtualenv ENV</pre></code>


source进入该环境
<pre data-user="fredliang" class="command-line language-bash"><code>source venv/bin/activate</pre></code>



在虚拟环境安装包
<pre data-user="fredliang" class="command-line language-bash" ><code>pip install jinja2</pre></code>



退出当前的venv环境，使用deactivate命令：
<pre data-user="fredliang" class="command-line language-bash" ><code>deactivate </pre></code>


## 4.pyenv

Python 多版本共存的方案，类似 nvm 实际上并不能作为一个很好的虚拟环境方案，简单写一下相关的操作。

查看可安装 Python 版本
<pre data-user="fredliang" class="command-line language-bash"><code>pyenv install --list</pre>
</code>

安装相应版本
<pre data-user="fredliang" class="command-line language-bash"><code>pyenv install Python 的版本</pre></code>



全局 Python 版本
<pre data-user="fredliang" class="command-line language-bash"><code>pyenv global </pre></code>

