	// Coords for UCCS Engineering Building
	var UCCSLat = 38.8936;
	var UCCSLng = -104.8003;

	// Variables for various functions
	var map;
	var input;

	// Variables for Places
	var infoWindow;

	// Variables for Directions
	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();

	// Variable for Predictions
	var predictService = new google.maps.places.AutocompleteService();

	// Layers can only be used one at a time unless using a fusion table.
	var setTrafficLayer = false;
	var setBicycleLayer = false;

	// Initializes the map canvas
	function initialize() {

		var mapOptions = {
			center: new google.maps.LatLng(UCCSLat, UCCSLng),
			zoom: 13,
			mapTypeID: google.maps.MapTypeId.ROADMAP
		};

	    directionsDisplay = new google.maps.DirectionsRenderer(); 	

	    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

	    directionsDisplay.setMap(map);

	    var defaultBounds = new google.maps.LatLngBounds(
	        new google.maps.LatLng(UCCSLat, UCCSLng)
	    );

	    map.fitBounds(defaultBounds);

	    var request = {
	        location: defaultBounds,
	        radius: 500,
	    }

	    var markers = [];
	    input = document.getElementById('places-input');

	    // Location of Search Box
	    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	    var searchBox = new google.maps.places.SearchBox(input);

	    google.maps.event.addListener(searchBox, 'places_changed', function() {
	        var places = searchBox.getPlaces();

	        if (places.length == 0) {
      			return;
    		}
    		for (var i = 0, marker; marker = markers[i]; i++) {
      			marker.setMap(null);
    		}

    		markers = [];
    		var bounds = new google.maps.LatLngBounds();
    		for (var i = 0, place; place = places[i]; i++) {
      			var image = {
			        url: place.icon,
			        size: new google.maps.Size(71, 71),
			        origin: new google.maps.Point(0, 0),
			        anchor: new google.maps.Point(17, 34),
			        scaledSize: new google.maps.Size(25, 25)
		      	};

	      	var marker = new google.maps.Marker({
	      		map: map,
	      		icon: image,
	      		title: place.name,
	      		position: place.geometry.location
	      	});

	      	markers.push(marker);
	        bounds.extend(place.geometry.location);
			}

	    	map.fitBounds(bounds);
	    });

	    infowindow = new google.maps.InfoWindow();
	    var service = new google.maps.places.PlacesService(map);
	    service.nearbySearch(request, callbackPlaces);
	    predictService.getQueryPredictions({input: input}, callbackPredictions);

	    // Bias the SearchBox results towards places that are within the bounds of the
	    // current map's viewport.
	    google.maps.event.addListener(map, 'bounds_changed', function() {
	        var bounds = map.getBounds();
	        searchBox.setBounds(bounds);
	    });

	    directionsDisplay.setMap(map);
	}

	// Calls back with results and status of Places API
	function callbackPlaces(results, status) {
	  if (status != google.maps.places.PlacesServiceStatus.OK) {
	  	alert(status);
	  	return;
	  }
	  else {
	    for (var i = 0; i < results.length; i++) {
	      createMarker(results[i]);
	    }
	  }
	}

	// Calls back with predictions and status of Prediction API
	function callbackPredictions(predictions, status) {
		if ( status != google.maps.places.PlacesServiceStatus.OK) {
			alert(status);
			return;
		}

		var results = document.getElementById('results');

		for (var i = 0, prediction; prediction = prediction[i]; i++)	{
			results.innerHTML += '<li>' + prediction.description + '</li>';
		}
	}

	// Calculate the route from start location to end location
	function calcRoute() {
		var start = document.getElementById('start').value;
	  	var selectMode = document.getElementById('selectMode').value;

	  	var end = document.getElementById('end').value;
	  	//var placeLng = document.getElementById('end').name;

		var request = {
			origin: start,
			destination: end,
			travelMode: google.maps.TravelMode[selectMode]
		};

		directionsService.route(request, function(response, status) {
			if (status == google.maps.DirectionsStatus.OK) {
		      directionsDisplay.setDirections(response);
		    }
	  	});
	}

	// Adds listener and calls the initialize
	google.maps.event.addDomListener(window, 'load', initialize);