# Fred's Blog

> visit <https://blog.fredliang.cn>

## Theme

> visit <https://github.com/fredliang44/hugo-theme-refine>

## Getting started

Visit <https://gohugo.io/getting-started/installing/> to install hugo
then [config config.toml](https://gohugo.io/getting-started/configuration/) (optional)

``` shell
git clone git@github.com:fredliang44/blog.git
cd blog
git submodule init
git submodule update
```

## Serve

```  shell
hugo server -D
```

then visit <http://localhost:1313/>

## Build

```  shell
hugo
```

## Deploy

### Setup

using minify to squash assets, serving static files at tencent cloud cos

```shell
## minify assets support
## assume you've installed golang in your system
## https://github.com/tdewolff/minify/tree/master/cmd/minify

go get github.com/tdewolff/minify/cmd/minify

## cos set up (optional)
pip install coscmd
coscmd config -a $YOUR_ACCESS_KEY -s $YOUR_ACCESS_SECRET -b $YOUR_BUCKET_ID -r $YOUR_REGION
```

### Build & Upload

``` shell
sh ./deploy.sh
```
