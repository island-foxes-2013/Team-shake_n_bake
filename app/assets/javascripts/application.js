// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {


  //Jake-y Poo
	$('#comment_form').on('ajax:success', function(e, data){
		var comment = $('#comment_append').clone();
		$('#question_box p').last().append('<hr />');
		$(comment).text(data.comment.content).append('<br><span id="comment_date">comment by: ' + '<b>' + data.user.username + '</b>' + ' on ' + formatDate() + '</span>').insertAfter($('#question_box p').last());
		$('#comment_form textarea').val('');
	});

	$('.button_to').on('ajax:success', function(e, data){
		if ($('#vote_message').length == 0) {
		  $('#count span').text(data.count);
		  $('#question_box h1').append('<span id="vote_message" style=color:rgba(144,0,0,0.7);font-size:15px;margin-left:5px;> - ' + data.vote + '</span>');
		  setTimeout(function() {
        $('#vote_message').fadeOut(1000, function(){
          $('#vote_message').remove();
        });
      }, 600);
    };
	});


	// GREG START
	$('.sign-in-link').on('click', function(){
		$('.sign-up').slideUp();
		$('.sign-in').slideDown();
		$('.navbar-inverse').css('border-bottom-left-radius', '0');
		$('.navbar-inverse').css('border-bottom-right-radius', '0');		
		$('input#username').focus();

		$('.sign-in').on('mouseleave', function(){			
			$('.sign-in').slideUp();
			$('.navbar-inverse').css('border-bottom-left-radius', '5px');
			$('.navbar-inverse').css('border-bottom-right-radius', '5px');			
		});
	});

	$('.sign-up-link').on('click', function(){	
		$('.sign-in').slideUp();
		$('.sign-up').slideDown();
		$('.navbar-inverse').css('border-bottom-left-radius', '0');
		$('.navbar-inverse').css('border-bottom-right-radius', '0');			
		$('input#user_username').focus();

		$('.sign-up').on('mouseleave', function(){			
			$('.sign-up').slideUp();
			$('.navbar-inverse').css('border-bottom-left-radius', '5px');
			$('.navbar-inverse').css('border-bottom-right-radius', '5px');			
		});
	});
	// GREG END
});

//Jake-y Poo
function formatDate() {
	var date = new Date();
  var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  return months[date.getMonth()] + ', ' + date.getDate() + ' - ' + date.getFullYear();
};


// $(function(){
//   var html = "<%= escape_javascript(render(:partial => 'pretty_box')) %>";
//   $("#container").prepend(html);
// });

