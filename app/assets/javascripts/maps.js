	// Coords for UCCS Engineering Building
	var UCCSLat = 38.893659;
	var UCCSLng = -104.800321;

	var map;
	var input;

	// Variables for Places
	var infoWindow;

	// Variables for Directions
	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();

	// Layers can only be used one at a time unless using a fusion table.
	var setTrafficLayer = false;
	var setBicycleLayer = false;

	// Initializes the map canvas
	function initialize() {

	    directionsDisplay = new google.maps.DirectionsRenderer(); 	

	    map = new google.maps.Map(document.getElementById('map-canvas'), {
	    	zoom: 7,
	        mapTypeID: google.maps.MapTypeId.ROADMAP
	    });

	    directionsDisplay.setMap(map);

	    var defaultBounds = new google.maps.LatLngBounds(
	        new google.maps.LatLng(UCCSLat, UCCSLng)
	    );

	    map.fitBounds(defaultBounds)

	    var request = {
	        location: defaultBounds,
	        radius: 500,
	        types: ['parks']
	    }

	    var markers = [];
	    input = document.getElementById('places-input');

	    // Location of Search Box
	    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	    var searchBox = new google.maps.places.SearchBox(input);

	    google.maps.event.addListener(searchBox, 'places_changed', function() {
	        var places = searchBox.getPlaces();

	        // Create a marker for each place.
	        createMarker(places)

	        bounds.extend(place.geometry.location);
	    });

	    infowindow = new google.maps.InfoWindow();
	    var service = new google.maps.places.PlacesService(map);
	    service.nearbySearch(request, callback);

	    // Bias the SearchBox results towards places that are within the bounds of the
	    // current map's viewport.
	    google.maps.event.addListener(map, 'bounds_changed', function() {
	        var bounds = map.getBounds();
	        searchBox.setBounds(bounds);
	    });

	    directionsDisplay.setMap(map);

	    // Set different layers on top of Map canvas
	    setLayers();
	}

	// Calls back with results and status of APIs
	function callback(results, status) {
	    if (status == google.maps.places.PlacesServiceStatus.OK) {
	        for (var i = 0; i < results.length; i++) {
	            createMarkers(results[i]);
	        }
	    }
	}

	// Calculate the route
	function calcRoute() {
		var start = document.getElementById('start').value;
	  	var end = document.getElementById('end').value;

		var request = {
			origin: start,
			destination: end,
			travelMode: google.maps.TravelMode.DRIVING
		};

		directionsService.route(request, function(response, status) {
			if (status == google.maps.DirectionsStatus.OK) {
		      directionsDisplay.setDirections(response);
		    }
	  	});
	}

	// Creates markers for places
	function createMarker(place) {
	    var placeLoc = place.geometry.location;
	    var marker = new google.maps.Marker({
	        map: map,
	        position: place.geometry.location
	    });

	    google.maps.event.addListener(marker, 'click', function() {
	        infowindow.setContent(place.name);
	        infowindow.open(map, this);
	    });
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

	// Adds listener and calls the initialize
	google.maps.event.addDomListener(window, 'load', initialize);
