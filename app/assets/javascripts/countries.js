$(document).ready(function() {
   $("#tab-container li:first").addClass("selected");
   var location = window.location;
   var found = false;
   $("#tab-container li").click(function(){
      $("#tab-container li").removeClass("selected");
      $(this).addClass("selected");
   });
});
$(document).ready(function() {	
 
   jQuery('#currency').bind('ajax:before', function(){   	      
          jQuery('#country').hide();
          jQuery('.ajax-progress').show();
        }); 
        jQuery('#currency').bind('ajax:complete', function(){
        	jQuery('#country').show();
          jQuery('.ajax-progress').hide();
        });
	 
     });
