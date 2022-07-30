$(document).ready(function(){
	$(document).on("click", '#current_weather', function(){
		$("#weather_response").html("<i class='fa fa-refresh fa-spin'></i> Location and weather is syncing");
		var msg = document.getElementById("msg");
		if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(showPosition);
		} else {
		msg.innerHTML = "Geolocation is not supported by this browser.";
		}


		function showPosition(position) {
			$.ajax({
				type: "get",
				url: '/home/current_loc',
				data: {
					location: {
						lat: position.coords.latitude,
						lng: position.coords.longitude
					}
				},
				dataType: "script",
				success: function() {
					console.log('current weather');
				}
			});
		}

	  return false;
	});

});