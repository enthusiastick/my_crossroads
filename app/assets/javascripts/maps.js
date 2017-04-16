initMap = function() {
  var lat, lng, map, mapCanvas, mapOptions, marker, markerOptions;
  lat = parseFloat($("#map_canvas").data('latitude'));
  lng = parseFloat($("#map_canvas").data('longitude'));
  mapCanvas = document.getElementById("map_canvas");
  mapOptions = {
    center: {
      lat: lat,
      lng: lng
    },
    disableDefaultUI: true,
    disableDoubleClickZoom: true,
    keyboardShortcuts: false,
    scrollwheel: false,
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(mapCanvas, mapOptions);
  markerOptions = {
    animation: google.maps.Animation.DROP,
    map: map,
    position: {
      lat: lat,
      lng: lng
    }
  };
  return marker = new google.maps.Marker(markerOptions);
};

$(document).ready(function() {
  var maps = document.getElementById('map_canvas')
  if (maps) {
    return google.maps.event.addDomListener(window, "load", initMap);
  }
});
