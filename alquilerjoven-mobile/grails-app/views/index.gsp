<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		
	</head>
	<body>
		
		
		<script language="JavaScript">

		document.addEventListener("deviceready", onDeviceReady, false);
        var message = document.getElementById("message");
     // Cordova is ready
        //
        function onDeviceReady() {
        	console.log("ready");
        	getLocation();
        }
        function getLocation() {
            if (navigator.geolocation) {
            	console.log("1");
                navigator.geolocation.getCurrentPosition(showPosition, showError);
            }
            else { message.innerHTML = "Geolocation is not supported by this browser."; }
        }
 
        function showPosition(position) {
        	
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            var imageURL = "http://maps.googleapis.com/maps/api/staticmap?center="+ latitude + "," + longitude + "&zoom=14&size=288x100&sensor=false&akey=AIzaSyAFZq4109vmG24zN2f9ok6cGJqSpiujk64"+
            		"&markers="+ latitude + "," + longitude;
            
            var linked="room/search/?q=*:*&latitude="+latitude + "&longitude=" + longitude+ "&radius=5000";
            console.log(linked);
            //document.getElementById("locationHolder").innerHTML = 
             //           "Your current location is: (" + latitude + ", " + longitude + ")";
            document.getElementById("mapHolder").innerHTML = "<img src='" + imageURL + "' width=\"288\" height=\"100\">";
            document.getElementById("nearby").innerHTML = "<a href='" + linked + "'>Cerca de mi</a>";
            
        }
 
        function showError(error) {
            switch (error.code) {
                case error.PERMISSION_DENIED:
                    message.innerHTML = "User denied the request for Geolocation."
                    break;
                case error.POSITION_UNAVAILABLE:
                    message.innerHTML = "Location information is unavailable at this time."
                    break;
                case error.TIMEOUT:
                    message.innerHTML = "The request to get user location timed out."
                    break;
                case error.UNKNOWN_ERROR:
                    message.innerHTML = "An unknown error occurred. Try again later."
                    break;
            }
        }
        //getLocation();
    </script>
 <div data-role="content">

 <span style="margin-right: 5px" id="nearby">
<a href="room/search/?q=barcelona&latitude=&longitude=" title="cerca" id="status">mi</a>
</span>
 <p id="message"></p>
 	 <div id="mapHolder"></div>
       <!-- img src="https://maps.googleapis.com/maps/api/staticmap?center=Madison, WI&amp;zoom=14&amp;size=288x100&amp;markers=Madison, WI&amp;sensor=false"  width="288" height="100"-->
        <div data-role="fieldcontain">
            <fieldset data-role="controlgroup">
                <label for="searchinput1">
                </label>
                <input name="" id="searchinput1" placeholder="" value="" type="search">
            </fieldset>
        </div>
    
   
        <a data-role="button" href="room/search/?q=Barcelona">
            Search
        </a>
   
		
			<h1>jQM Autocomplete</h1>
			<div>
				<select id="examples" data-mini="true" data-native-menu="false">
					<option value="index.html" selected="true">Remote Array</option>
					<option value="complex.html">Remote Object</option>
					<option value="array.html">Local Array</option>
					<option value="local_complex.html">Local Object</option>
					<option value="callback.html">Callback</option>
					<option value="callback-plus.html">Callback Plus</option>
					<option value="search.html">Using Search Input</option>
				</select>
			</div>
		

		
			<h3>Remote Simple Data</h3>
			<p>
				In this example autoComplete returns an array of strings from a remote url.
			</p>
			<pre>
[
    "Maine",
    "Maryland"
]
			</pre>
			<p>
				<input type="text" id="searchField" placeholder="US States"/>
				<ul id="suggestions" data-role="listview" data-inset="true"></ul>
			</p>
			<p>
				<a href="https://github.com/commadelimited/autoComplete.js" data-role="button">Download the code</a>
			</p>
		

	
		
</div>  

	<script>

		$("#mainPage").bind("pageshow", function(e) {

			$("#searchField").autocomplete({
				target: $('#suggestions'),
				source: 'data.cfc?method=search&returnformat=json&data=simple',
				link: 'target.html?term=',
				minLength: 1
			});

		});
	</script>
		
	</body>
</html>
