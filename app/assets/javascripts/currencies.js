$(document).ready(function(){
$('#currency-refresh').bind('ajax:before', function(){
				alert(234)
        $('.currency-live-data').hide();
        $('.ajax-progress').show();
    }); 
    $('#currency-refresh').bind('ajax:complete', function(){
				alert(456)
        $('.ajax-progress').hide();
				$('.currency-live-data').show();
        
    });	
	
})