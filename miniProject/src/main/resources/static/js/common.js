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

/**
 * 유효성 체크
 *
 *
 */
var validCheck = function(){
   var flag = '';
   var flag2 = true;
   $('.check').each(function(){
      flag = true;
      var value = '';
      var errorCode = "";
      errorCode = $(this).data('code');
     
      if($(this).attr('type') == 'radio'){
         value = $('input[name=\"' + $(this).attr('name') + '\"]:checked').val();
      }else{
         value = $(this).val().trim();
      }
      if(stringNull(value) == ''){   
          flag = false;
          flag2 = false;
      }
      if(!flag){
          $('.error_'+errorCode).removeClass('d-none');
      }else{
          $('.error_'+errorCode).addClass('d-none');
      }
   });
   if(!flag2){
       return false;
   }else{
       return true;
   }
}

//숫자만 허용
var noNumber3 = function(value){
    value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1').replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '');
}

//입력값에 숫자만 허용
function noNumber2(value){
    var c;
    for(var i=0;i<value.length;i++){
        c=value.charAt(i);
        if(c<'0'||c>'9'){           
            return true;
        }
    }
    return false;
}
