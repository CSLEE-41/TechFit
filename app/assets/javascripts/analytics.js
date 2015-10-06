

var blocmetrics = {};

blocmetrics.report = function(arg1){
  // eventually this function is going to send an AJAX request to the server
  // and it will store the event in the database  For now it is just logging to console.
  // This is a stub.


  // What contoller action do we need to send a request 
  //to in order to write a new event to the DB
  // /api/events POST
           

  var event = {event: {name: arg1 }};

  var request = new XMLHttpRequest();
  request.open("POST", "https://prestige-analytics.herokuapp.com/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');

  request.onreadystatechange = function() {
    // #2
  };

  request.send(JSON.stringify(event));
};



$(document).ready(function(){

  $("#sgn-sbmt").click(blocmetrics.report('Sign-up'));
  $("#wkt-sbmt").click(blocmetrics.report('Workout'));
  $("#ntr-sbmt").click(blocmetrics.report('Nutrition'));
  $("#rec-sbmt").click(blocmetrics.report('Recipe'));
  $("ph-sbmt").click(blocmetrics.report('Photo'));

});