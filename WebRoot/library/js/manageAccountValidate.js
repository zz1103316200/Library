$(document).ready(function(){

    var form1 = $('#manageAccount');
    form1.validate({
        errorElement: 'span', //default input error message container
        errorClass: 'help-block', // default input error message class
        rules: {
    	    accountUserName: {
               // minlength: 2,
                maxlength: 20,
    			required: true
            },
            accountPassWord: {
            	maxlength: 20,
            	required: true
               
                //email: true
            },
            confirmPassWord: {
            	maxlength: 20,
            	required: true
               
                //email: true
            }
        },
        
		highlight:function(element, errorClass, validClass) {
			$(element).parents('.control-group').addClass('error');
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).parents('.control-group').removeClass('error');
			$(element).parents('.control-group').addClass('success');
		}
    });

});

