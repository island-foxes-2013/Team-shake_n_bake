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


  if ($('[name="commit"]')) {}

	$('#comment_form').on('ajax:success', function(e, data){
		console.log(data);
    // var html = "<%= escape_javascript(render(:partial => 'comment_form')) %>";
    // $("#question_body").prepend(html);
		var comment = $('#comment_append').clone()
		$(comment).text(data.comment.content).insertAfter($('#question_body'));
		// console.log(comment)
		// $(comment).appendTo('#question_box');
	});

	// COLE'S TEAM
  // $('form#new_vote').on('ajax:success', function(event, response, status, xhr) {
  //   console.log($(event.target[0]));
  //   $(event.target).parent('li').find('.vote_count').html(xhr.responseJSON.num_votes);
  // });

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


// $("#new_vote").find('[name="commit"]')

// $(function(){
//   var html = "<%= escape_javascript(render(:partial => 'pretty_box')) %>";
//   $("#container").prepend(html);
// });
