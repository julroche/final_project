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
//= require jquery-ui
//= require_tree .


$(document).ready(function() {
  $("#event_many_dates").multiDatesPicker();

	$('#save_dates').click(function() {
		saveDates()
	});

	// $('a.step1trig').click(function() {
	// 	$('.step1').addClass('current_step');
	// });

	// $('.nextbutton1').click(function() {
	// 	$('.step2').addClass('current_step');
	// });

	// $('a.step3trig').click(function() {
	// 	$('.step3').addClass('current_step');
	// });

	var saveDates = function () {
		var dates = $("#event_many_dates").multiDatesPicker('getDates');
		console.log(dates);
	};

	$('#save_dates').click(function() {
		saveDates()
	});


});



// var dates = $("#end_at").multiDatesPicker('getDates');

// 		$('#colors').append('<div class="color" style="background-color:' + colorString + '"/div>');
// 		console.log($('div.color').length);

// 	$('#add').click(function() {
// 		var colorVal= $('#colors_string').val();
// 		console.log(colorVal);
// 		$('#colors_string').css('background-color',colorVal);
// 		makeSq(colorVal);
// 	});



