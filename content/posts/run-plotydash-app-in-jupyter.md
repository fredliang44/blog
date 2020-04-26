---
author: "Fred Liang"
categories: ["Python"]
date: 2018-01-02T09:23:43Z
description: "Run ploty dash app in jupyter notebook"
draft: false
image: "/images/2018/01/92532.jpg"
slug: "run-plotydash-app-in-jupyter"
tags: ["Python"]
title: "Run ploty dash app in jupyter notebook"

---

You could insert the code in begining of the jupyter notebook.

``` Python
from IPython import display
def show_app(app,  # type: dash.Dash
             port=9999,
             width=700,
             height=350,
             offline=True,
             style=True,
             **dash_flask_kwargs):
    """
    Run the application inside a Jupyter notebook and show an iframe with it
    :param app:
    :param port:
    :param width:
    :param height:
    :param offline:
    :return:
    """
    url = 'http://localhost:%d' % port
    iframe = '<iframe src="{url}" width={width} height={height}></iframe>'.format(url=url,width=width,height=height)
    display.display_html(iframe, raw=True)
    if offline:
        app.css.config.serve_locally = True
        app.scripts.config.serve_locally = True
    if style:
        external_css = ["https://fonts.googleapis.com/css?family=Raleway:400,300,600",
                        "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css",
                        "http://getbootstrap.com/dist/css/bootstrap.min.css", ]

        for css in external_css:
            app.css.append_css({"external_url": css})

        external_js = ["https://code.jquery.com/jquery-3.2.1.min.js",
                       "https://cdn.rawgit.com/plotly/dash-app-stylesheets/a3401de132a6d0b652ba11548736b1d1e80aa10d/dash-goldman-sachs-report-js.js",
                       "http://getbootstrap.com/dist/js/bootstrap.min.js"]

        for js in external_js:
            app.scripts.append_script({"external_url": js})

    return app.run_server(debug=False,  # needs to be false in Jupyter
                          port=port,
                          **dash_flask_kwargs)

```

