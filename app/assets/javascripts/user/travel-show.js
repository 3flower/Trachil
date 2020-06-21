$(function(){

  $('#show-play-btn').click(function(){
    $('#play-show').fadeIn();
    $('#hotel-show').fadeOut();
    $('#meal-show').fadeOut();
  });
  $('#show-hotel-btn').click(function(){
    $('#play-show').fadeOut();
    $('#hotel-show').fadeIn();
    $('#meal-show').fadeOut();
  });
  $('#show-meal-btn').click(function(){
    $('#play-show').fadeOut();
    $('#hotel-show').fadeOut();
    $('#meal-show').fadeIn();
  });

  if($('#show-play-btn').text() == "遊び"){
      $('#play-show').fadeIn();
    } else if ($('#show-hotel-btn').text() == "ホテル") {
      $('#hotel-show').fadeIn();
    } else {
      $('#meal-show').fadeIn();
    }

});

let map;
let play_map;
let hotel_map;
let meal_map;
let play_geocoder;
let hotel_geocoder;
let meal_geocoder;
// playのマップ
function initMap(){
  play_geocoder = new google.maps.Geocoder()
  hotel_geocoder = new google.maps.Geocoder()
  meal_geocoder = new google.maps.Geocoder()

  // Mapを表示する
  if($('#play-show').length) {
    play_map = new google.maps.Map(document.getElementById('play-map'), {
      // latが緯度、lngが経度
      center: {lat: 34.702299, lng: 135.497450},
      // zoomは0〜21まで指定できる。数値が大きいほど拡大できる
      zoom: 16,
    });
  }
  if ($('#hotel-show').length) {
    hotel_map = new google.maps.Map(document.getElementById('hotel-map'), {
       // latが緯度、lngが経度
       center: {lat: 34.702299, lng: 135.497450},
       // zoomは0〜21まで指定できる。数値が大きいほど拡大できる
       zoom: 16,
    });
  }
  if ($('#meal-show').length)  {
    meal_map = new google.maps.Map(document.getElementById('meal-map'), {
      // latが緯度、lngが経度
      center: {lat: 34.702299, lng: 135.497450},
      // zoomは0〜21まで指定できる。数値が大きいほど拡大できる
      zoom: 16,
    });

  }



  codeAddress()
  function codeAddress(){
    var play_address = $('#play-address').text()
    var meal_address = $('#meal-address').text()
    var hotel_address = $('#hotel-address').text()

    play_geocoder.geocode( { 'address': play_address}, function(results, status) {
      if (status == 'OK') {
      play_map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
          map: play_map,
          position: results[0].geometry.location
        });
      }
    });
    hotel_geocoder.geocode( { 'address': hotel_address}, function(results, status) {
      if (status == 'OK') {
      hotel_map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
          map: hotel_map,
          position: results[0].geometry.location
        });
      }
    });
    meal_geocoder.geocode( { 'address': meal_address}, function(results, status) {
      if (status == 'OK') {
      meal_map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
          map: meal_map,
          position: results[0].geometry.location
        });
      }
    });
  }
}
