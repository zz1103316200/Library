$(document).ready(function(){

    var form1 = $('#volunteer');
    form1.validate({
        errorElement: 'span', //default input error message container
        errorClass: 'help-block', // default input error message class
        rules: {
    	    volunteerName: {
               // minlength: 2,
                maxlength: 20,
    			required: true
            },
            tel: {
            	rangelength:[11,11],
            	required: true,
            	digits:true
               
                //email: true
            },
            registOrganization: {
            	maxlength: 20
               
                //email: true
            },
            commonAddress: {
            	maxlength: 20,
            	required: true
               
                //email: true
            },
            volunteerIdCard: {
            	
            	rangelength:[18,18],
            	required: true
                //email: true
            },
            volunteerSpeciality: {
            	maxlength: 1000,
            	required: true
               
                //email: true
            }
        },
        
		highlight:function(element, errorClass, validClass) {
			$(element).parents('.first').addClass('error');
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).parents('.first').removeClass('error');
			$(element).parents('.first').addClass('success');
		}
    });

});

