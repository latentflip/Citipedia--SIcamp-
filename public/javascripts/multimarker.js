
var IMAGES = [ "sun", "rain", "snow", "storm" ];
var ICONS = [];
var map = null;
var mgr = null;

function setupMap(lat, long, controls, init_zoom) {
    if (typeof lat == 'undefined' ) lat = 55.8667230193505;
    if (typeof lon == 'undefined' ) lon = -4.24999237060547;
    if (typeof controls == 'undefined' ) controls = 0;
    if (typeof init_zoom == 'undefined' ) init_zoom = 13; else init_zoom = parseInt(init_zoom);
  if (GBrowserIsCompatible()) {
    map = new GMap2(document.getElementById("map"));
    if(controls==1) {
        map.addControl(new GLargeMapControl());
    }
    map.setCenter(new GLatLng(lat, lon), init_zoom);
    map.enableDoubleClickZoom();
    window.setTimeout(setupWeatherMarkers, 0);
  }
}

function getWeatherIcon(name) {
    var icon = new GIcon();
    icon.image = "/images/" 
		+ name + ".png";
    icon.iconAnchor = new GPoint(16, 16);
    icon.infoWindowAnchor = new GPoint(16, 0);
    icon.iconSize = new GSize(32, 32);
    icon.shadow = "/images/" 
		+ name + "-shadow.png";
    icon.shadowSize = new GSize(59, 32);
	return icon
}

function setupWeatherMarkers() {
  mgr = new MarkerManager(map);
  var batch = [];
	var tmp = 'asdf';
	$.getJSON("/sites/data.json", function(data) {
		$.each(data.items, function(i, item){
			var loc = new GLatLng(item.lat, item.long);
			var marker = new GMarker(loc, { icon: getWeatherIcon('rain')  });
			batch.push(marker);
			mgr.addMarker(marker, 3);
		});
	});
  mgr.refresh();
}

 
$(document).ready(function() {
    var lat = $("#map_lat").text();
    var lon = $("#map_lon").text();
    var controls = $("#map_controls").text();
    var zoom = $("#map_zoom").text();    
	setupMap(lat, lon, controls, zoom);
});
	$(window).unload(function() { GUnload(); } );
