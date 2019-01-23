 var url_string = window.location.href
 var url = new URL(url_string);
 var dish_name = url.searchParams.get("name");
  $(document).ready(function(){
  $("#filter_sort").change(function(){
    $.ajax({
     url: '/search',
     type: 'GET',
     dataType: 'script',
     data: {filter: this.value,name:dish_name},
     success: function(repsonse){
      },
  });
   }); 
  $(".tag").change(function(){
    var checkbox = [];
    var dishes_name= [];    
    var temp = '';                                     
   $(':checkbox:checked').each(function(i){
    checkbox[i] = $(this).attr("id");
    dishes_name[i] = $(this).attr("name");
     console.log(dishes_name)
      });
   for(var x=0; x<dishes_name.length;x++){
      temp += dishes_name[x]+",";
        }
    $("#check_boxid").text(temp);
    console.log(checkbox)
     $.ajax({
     url: '/search',
     type: 'GET',
     dataType: 'script',
     data: {tagging: checkbox,name:dish_name},
       success: function(repsonse){}
    });
   });
   $("#rating_filter").change(function(){
    $.ajax({
     url: '/search',
     type: 'GET',
     dataType: 'script',
     data: {rating: this.value, name:dish_name},
     success: function(repsonse){},
  });
   }); 
  var slider = $("#the_slider").slider({
    range: true,
    min: 50,
    max: 250,
    values: [50, 250],
  slide: function(event, ui) {
     var a = ui.values[0];
     var b = ui.values[1];
     // $('.range_text').val("$"+ ui.values[0]+ "- $"+ui.values[1]);
     $('#min').text("$"+ ui.values[0])
     $('#max').text("$"+ ui.values[1])
    $.ajax({
        url: '/search',
       type: 'GET',
       dataType: 'script',
       data: {min:a, max:b,name:dish_name},
       success: function(repsonse){
        },
      });
      }
    });
    });
  function initMap() {
    var map = new google.maps.Map(document.getElementById('mapimage'),{
      center:{lat: 17.0005, lng: 81.8040} ,
      zoom: 4,

      });
    // var location = [{lat: 16.9437, lng: 82.2351},{lat: 17.0005, lng: 81.8040},{lat: 17.0005, lng: 84.8040}];
    var location = gon.locations
    for(var i=0;i<location.length; i++ ){
    var marker = new google.maps.Marker({
     position: {lat: location[i].latitude, lng: location[i].longitude},
     map: map,
     title: location[i].location,
     
      }); 
        }
        google.maps.event.addListener(map, 'click', function(event) {

        addPoint(event);
    });
      }




