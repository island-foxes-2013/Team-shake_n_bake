// Place all the behaviors and hooks related to the matching controller here.
// ll this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$( document ).ready(function() {
    $("button").on("click", function(event) {
      $(".edit_user").show()
    });

    $('#color-form').submit(function() {
      $.cookie('background_color', $('input[name="color"]').val(), { path: '/', domain: ''});
      location.reload();
      return false;
    });


    $('.profile').css('background-color', $.cookie('background_color'));
    
});