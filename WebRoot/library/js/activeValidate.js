$(document).ready(function(){

    var form1 = $('#active');
    form1.validate({
        errorElement: 'span', //default input error message container
        errorClass: 'help-block', // default input error message class
        rules: {
            activeTitle: {
               // minlength: 2,
                maxlength: 40,
    			required: true
            },
            activePublisher: {
            	maxlength: 20,
            	required: true
               
                //email: true
            },
            activeContent: {
            	maxlength: 4000,
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

