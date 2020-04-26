---
author: "Fred Liang"
date: 2017-12-05T07:22:00Z
description: "Valine 是一款基于 Leancloud 的极简评论系统，作者为 xCss，为了替代天国的多说及网易云跟帖。"
draft: false
image: "https://cdn.blog.fredliang.cn/photo-1453738773917-9c3eff1db985?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ&s=70e449568bbd046996dd624a05ec69f0"
slug: "valine-ping-lun-xi-tong"
title: "Valine  评论系统"

---

Valine 是一款基于 Leancloud 的极简评论系统，作者为 xCss，为了替代天国的多说及网易云跟帖。

- Github Repo： https://github.com/xCss/Valine
- 预览： https://valine.js.org/

## 使用方法
注册 Leancloud 并新建一个应用，获取 `APP ID` 及 `APP KEY`
然后引入 HTML

``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Valine - A simple comment system based on Leancloud.</title>
    <!-- Leancloud 操作库 -->
    <script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
    <!-- Valine 的核心代码库 -->
    <!-- 可以使用 https://valine.js.org/dist/Valine.min.js -->
    <!-- 或者使用 https://cdn.con.sh/raw/xCss/Valine/master/dist/Valine.min.js （国内 CDN） -->
    <script src="./dist/Valine.min.js"></script>
</head>
<body>
    <div class="comment"></div>
    <script>
        new Valine({
            av: AV, 
            el: '.comment', // 
            app_id: 'Your APP ID', // 这里填写上面得到的APP ID
            app_key: 'Your APP KEY', // 这里填写上面得到的APP KEY
            placeholder: 'ヾﾉ≧∀≦)o来啊，快活啊!' // [v1.0.7 new]留言框占位提示文字
        });
    </script>
</body>
</html>
```

评论数据管理
关于评论数据管理，请自行登录 Leancloud 应用管理。

具体步骤：登录>选择你创建的应用>存储>选择 ClassComment

