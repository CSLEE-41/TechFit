

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
  request.open("POST", "http://localhost:3000/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');

  request.onreadystatechange = function() {
    // #2
  };

  request.send(JSON.stringify(event));
};



$(document).ready(function(){

  $("#sgn-sbmt").click(blocmetrics.report('Test'));
  $("#wkt-sbmt").click(blocmetrics.report('Workouts'));

});