---
title: "一个老年毕业旅行计划"
date: 2019-09-29T14:26:14+08:00
draft: true
---
<script src='https://api.mapbox.com/mapbox-gl-js/v1.3.2/mapbox-gl.js'></script>
<link href='https://api.mapbox.com/mapbox-gl-js/v1.3.2/mapbox-gl.css' rel='stylesheet' />
<div id='map' style='width: 100%; height: 500px;'></div>

<script>mapboxgl.accessToken = 'pk.eyJ1IjoiZnJlZGxpYW5nIiwiYSI6ImNrMTRuZWVsMTA5eXkzY21yODI2bzhqeDUifQ.nTOr_fVWnooxjv-gB9Kssg';
var map = new mapboxgl.Map({
container: 'map',
style: 'mapbox://styles/fredliang/ck14nivpw0j5m1cmt8zkttzbz'
});
map.on('load', function () {
map.addSource('test', {
type: 'vector',
url: 'mapbox://fredliang.ck14njq9i0ptp2ip88jouzl0u-61mw6'
});
map.addLayer({
'id': 'test',
'type': 'line',
'source': 'test',
'source-layer': 'test',
'layout': {
'visibility': 'visible',
'line-join': 'round',
'line-cap': 'round'
},
'paint': {
'line-color': '#877b59',
'line-width': 1
}
});
})
</script>