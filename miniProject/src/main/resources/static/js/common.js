/**
 * 
 */
 
$(function(){
	 	 
	$(document).on('input', '.inputNumberFormatComma', function(){
		if($(this).val() != null && $(this).val() != '' && $(this).val() != undefined){			
			$(this).val($(this).val().replace(/[^\d]+/g, '').replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		}
	});
});