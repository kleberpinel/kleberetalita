// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

 $(document).ready(function() {

	  $("a.iframe").fancybox({
	  	'width': 1100,
		'height': 800,
	    'transitionIn'    :    'elastic',
	    'transitionOut'    :    'elastic',
	    'speedIn'        :    400,
	    'speedOut'        :    200,
	    'overlayShow'    :    false,
	    onStart     :   function() {
        	//return window.confirm('Continue?');
	    },
	    onCancel    :   function() {
	        //alert('Canceled!');
	    },
	    onComplete  :   function() {
	        //alert('Completed!');
	    },
	    onCleanup   :   function() {
	        //return window.confirm('Close?');
	    },
	    onClosed    :   function() {
	        //alert('Closed!');
	    }
	  });
    $("a.iframe_defaults").fancybox();
  
});