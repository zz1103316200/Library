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
            age: {
            	rangelength:[1,2],
            	
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
            cardNumber: {
            	maxlength: 20,
            	
            	//email: true
            },
            volunteerSpeciality: {
            	maxlength: 1000,
            	
               
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

