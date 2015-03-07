// DEV OPTIONS:

// Layers can only be used one at a time unless using a fusion table.
var setTrafficLayer = false;
var setBicycleLayer = true;


// Coords for UCCS Engineering Building
var UCCSLat = 38.893659;
var UCCSLng = -104.800321;

var map;

// Adds listener and calls the initialize
google.maps.event.addDomListener(window, 'load', initialize);

// Detects whether user is on desktop or mobile
function detectBrowser()	{
	var useragent = navigator.userAgent;
	var mapdiv = document.getElementById("map-canvas");

	if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1) {
		mapdiv.style.width = '100%';
		mapdiv.style.height = '100%';
	}
	else {
		mapdiv.style.width = '600px';
		mapdiv.style.height = '800px';
	}
}

//	Initializes the map canvas and looks for location
function initialize()	{

	var markers = [];
	var input = document.getElementById('pac-input');

	// This needs the PLACE API LINK in MAIN LINK ABOVE
/*		var searchBox = new google.maps.places.SearchBox(input);*/ 
	var mapOptions = {
		zoom: 14
	};

	map = new google.maps.Map(document.getElementById('map-canvas'),
		mapOptions);

	// Location of Search Box (DEV: Doesn't work atm)
	map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	//Try HTML5 Geolocation
	if(navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
			var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

			/*var infowindow = new google.maps.InfoWindow({
				map: map,
				position: pos,
				content: ''
			})*/

			map.setCenter(pos);
		}, function(){
			handleNoGeolocation(true);
		});
	}
	else {
		handleNoGeolocation(false);
	}

	// var infowindow = new google.maps.InfoWindow(mapOptions);
	// map.setCenter(mapOptions.position)

	// Set different layers on top of Map canvas
	setLayers();
}

// Handle error with not finding a Geolocation.
function handleNoGeolocation(errorFlag)	{
	if (errorFlag)	{
		var content = '';
	}
	else {
		var content = 'Error: Your browser doesn\'t support geolocation';
	}

	var mapOptions = {
		map: map,
		position: new google.maps.LatLng(UCCSLat, UCCSLng),
		content: content 
	};

	//var infowindow = new google.maps.InfoWindow(mapOptions);
	map.setCenter(mapOptions.position)
}

// Handle Layers for Map canvas
function setLayers() {
	if (setTrafficLayer) {
		var trafficLayer = new google.maps.TrafficLayer();
		trafficLayer.setMap(map);		
	}

	if (setBicycleLayer) {
		var bicycleLayer = new google.maps.BicyclingLayer();
		bicycleLayer.setMap(map);
	}
}
