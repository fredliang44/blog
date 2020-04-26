hugo
python3 hugo-encryptor.py

find ./public -name "*.html" -exec minify --html-keep-document-tags --html-keep-end-tags  -o {} {} \;

coscmd upload --sync  --recursive ./public/ /
rm -rf ./public
# qcloudcli cdn RefreshCdnDir --dirs   https://blog.fredliang.cn/