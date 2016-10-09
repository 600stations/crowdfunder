// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Document Ready
// $(function() {
//   // 1. Listen for click events on our links
//   $('.robot > a').on('click', function(eventObject) {
//     // 2. Prevent the default behaviour (following the link)
//     eventObject.preventDefault();
//
//     // 3. Send an AJAX request to the server
//     $.ajax({
//       url: $(this).attr('href'),
//       method: 'GET',
//       data: {},
//       dataType: 'json'
//     }).done(function(responseData) {
//       var priceString = '$' + (responseData.model_number / 100);
//
//       // 4. Take the response from the server and insert it into the page
//       console.log(responseData);
//
//       // This worked for the HTML response, but not for the JSON response
//       // $('#robot-details').html(responseData);
//
//       // $('#robot-details').html('');
//
//       var container = $('<div>');
//
//       $('<img>').attr('src', 'http://robohash.org/' + responseData.address)
//                 .appendTo(container);
//
//       $('<h1>').html(responseData.name).appendTo(container);
//
//       // <p>Price: <strong>$123.45</strong></p>
//       var priceParagraph = $('<p>').html('Price: ');
//       var priceStrong = $('<strong>').html(priceString);
//
//       priceParagraph.append(priceStrong).appendTo(container);
//
//       $('#robot-details').html(container);
//     });
//   });
// });

//First example done by Mina ends 40mins
$(function() {
  $('.robot > a').on('click', function(eventObject) {
    eventObject.preventDefault();

    $.ajax({
      url: $(this).attr('href'),
      method: 'GET',
      data: {},
      dataType: 'json'
    }).done(function(responseData) {
      //THis worked when we were requesting html
      //but won't work if response is JSON.
      //$('#robot-details').html(responseData);

      var robotContainer = $('<div>');

      $('<h2>').html('Title: ' + responseData.title).appendTo(robotContainer);
      $('<p>').html('Description: ' + responseData.description).appendTo(robotContainer);
      $('<p>').html('Deadline: ' + responseData.deadline).appendTo(robotContainer);
      $('<p>').html('Goal: ' + responseData.goal).appendTo(robotContainer);
      // $('<button>').html(link_to "Make a Pledge", new_project_pledge_path(@project)).appendTo(robotContainer);

      $('#robot-details').html(robotContainer);

    });
  });
});
// then goes to the page and refreshes
