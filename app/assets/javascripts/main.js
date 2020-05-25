$( document ).ready(function() {
    $('.pick_date,.drop_date').datepicker({
		  'format': 'mm/dd/yyyy',
		  'autoclose': true
		});
	  $('#time_pick').timepicker();
});