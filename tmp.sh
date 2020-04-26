add_rsp_header('server', 'potato-server/v0.0.1')
# images, fonts, 6month
match_long_cache = match_re($request_uri, 'https?://.+\.(jpg|gif|png|jpeg|woff|woff|ttf|svg|eot)')

# js, css, 1 month
match_short_cache = match_re($request_uri, 'https?://.+\.(js|css)')

if match_short_cache:
    add_rsp_header('Cache-Control', 'max-age=2592000')
if match_long_cache:
    add_rsp_header('Cache-Control', 'max-age=15768000')

