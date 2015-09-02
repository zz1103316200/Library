$(document).ready(function(){

    var form1 = $('#news');
    form1.validate({
        errorElement: 'span', //default input error message container
        errorClass: 'help-block', // default input error message class
        rules: {
           	newsTitle: {
               // minlength: 2,
                maxlength: 40,
    			required: true
            },
            newsPublisher: {
            	maxlength: 20,
            	required: true
               
                //email: true
            },
            newsContent: {
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

