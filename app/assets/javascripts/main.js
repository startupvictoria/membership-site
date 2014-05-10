/* 
 Document   : style
 Created on : 18/04/2014, 11:09:13 AM
 Author     : Emre Rothzerg
 */

$(function() {
    $("ul.dropdown li").hover(function() {
        $(this).addClass("navhover");
        $('ul:first', this).css('visibility', 'visible');
    }, function() {
        $(this).removeClass("navhover");
        $('ul:first', this).css('visibility', 'hidden');
    });
	
	$('#payment-form .ccnum').on('keyup',function(e){

        var ccnum = ($(this).val());
        var ccnum_int = ccnum.replace(/[^0-9\.]/g, '');
        if (ccnum != ccnum_int) {
            this.value = ccnum_int;
        }
	});
	
	$('#payment-form .ccv').on('keyup',function(e){

        var ccv = ($(this).val());
        var ccv_int = ccv.replace(/[^0-9\.]/g, '');
        if (ccv != ccv_int) {
            this.value = ccv_int;
        }
	});
});
$(document).ready(function() { //ajaxforumeditor


    $('.ajaxform').ajaxForm({
        success: function(data) {
            $('#ajaxreturn').html(data);
        }
    });
	
	$('#payment-form').submit(function(e) {
		e.preventDefault();
		var $form = $(this);

		var validation = true;
		//validation
		var name_ele = $(this).children().find('.fullname');
		var email_ele = $(this).children().find('.email');
		var password_ele = $(this).children().find('.password');
		var ccnum_ele = $(this).children().find('.ccnum');
		var ccv_ele = $(this).children().find('.ccv');
		var exp_month_ele = $(this).children().find('.exp_month');
		var exp_year_ele = $(this).children().find('.exp_year');
		
     	var name = $.trim(name_ele.val());
		var email = $.trim(email_ele.val());
		var password = $.trim(password_ele.val());
		var ccnum = $.trim(ccnum_ele.val());
		var ccv = $.trim(ccv_ele.val());
		var exp_month = $.trim(exp_month_ele.val());
		var exp_year = $.trim(exp_year_ele.val());
		
		if(name=='')
		{
			name_ele.parent().children('.form_field_msg').html('Please enter your full name').show();
			validation = false;
		}
		else
		{
			name_ele.parent().children('.form_field_msg').hide();
		}
		
		if(email=='')
		{
			email_ele.parent().children('.form_field_msg').html('Please enter the email').show();
			validation = false;
		}
		else
		{
			if(!validateEmail(email))
			{
				email_ele.parent().children('.form_field_msg').html('Please enter a valid email').show();
				validation = false;
			}
			else{
				email_ele.parent().children('.form_field_msg').hide();
			}
		}
		
		if(password=='')
		{
			password_ele.parent().children('.form_field_msg').html('Please enter the password').show();
			validation = false;
		}
		else
		{
			if(password.length<6)
			{
				password_ele.parent().children('.form_field_msg').html('Password must be at least 6 characters long').show();
				validation = false;
			}
			else{
				password_ele.parent().children('.form_field_msg').hide();
			}
		}
		
		if(ccnum=='')
		{
			ccnum_ele.parent().children('.form_field_msg').html('Please enter the credit card number').show();
			validation = false;
		}
		else
		{
			ccnum_ele.validateCreditCard(function(result)
{
				/* alert('CC type: ' + result.card_type.name
				  + '\nLength validation: ' + result.length_valid
				  + '\nLuhn validation:' + result.luhn_valid); */
				if(!result.length_valid || !result.luhn_valid)
				{
					ccnum_ele.parent().children('.form_field_msg').html('Please enter a valid credit card number').show();
					validation = false;
				}
				else{
					ccnum_ele.parent().children('.form_field_msg').hide();
				}
			});
			
		}
		
		//alert(validation);
		//return false;
		
		if(ccv=='')
		{
			ccv_ele.parent().children('.form_field_msg').html('Please enter CCV number').show();
			validation = false;
		}
		else
		{
			if(ccv.length>4)
			{
				ccv_ele.parent().children('.form_field_msg').html('CCV number cannot be more than 4 characters').show();
				validation = false;
			}
			else{
				ccv_ele.parent().children('.form_field_msg').hide();
			}
		}
		
		if(exp_month=='' || exp_year=='')
		{
			exp_month_ele.parent().parent().children('.form_field_msg').html('Please select an expiry date').show();
			validation = false;
		}
		else
		{
			exp_month_ele.parent().parent().children('.form_field_msg').hide();
		}
		
		//validation end
		
		if(!validation)
		{
			return false;
		}
		
		//alert("111");
		//return false;
		// Disable the submit button to prevent repeated clicks
		$form.find('button').prop('disabled', true);

		Stripe.card.createToken($form, stripeResponseHandler);

		// Prevent the form from submitting with the default action
		return false;
	});
		
		
    /* $('.ajaxform').submit(function(e){
    
		//alert("wef");
		e.preventDefault();
		
		var myForm =  $(this).parents('form:first');
		var myURL = $(this).attr('action');
		var myFormName = $(this).attr('name');
			
		// call the pre submit hook
		var preSubmitHook = myFormName + "_validation";
		if (typeof window[preSubmitHook] == 'function') {
			//invoke the preSubmit function;
			var val = window[preSubmitHook]($(this));
			if (val == false) return false;
		}
			
		var options = new Object();
		options = {
				type:'POST',
				dataType:'json',
				data:{"HTTP_X_REQUESTED_WITH":"xmlhttprequest"},
				//iframeSrc:window.location.href,
				success:function(data) {
					ajaxCallBack(data);
				}	
		}
		
    	$(this).ajaxSubmit(options);
    	
    	return false;
    }); */

    
});

function payment_form_cb(){
	//alert("tet");
	$('#payment-form').find('button').prop('disabled', false);
}

/*function ajaxCallBack(data) {

	var rData;
	if (typeof data.MESSAGE === 'undefined')
		rData = data;
	else 
		rData = jQuery.parseJSON(data);
		
	if (typeof rData.CB === 'undefined') {
		return false;
	}
	//var rData = data;
	var cbFuncName = 'DScallBack_' + rData.CB;
	
    //alert(cbFuncName);
	
	if (typeof window[cbFuncName] != 'function') {
		console.log('Invalid ajax return type ' + cbFuncName);
		return;
	}
	
	//invoke the callback function;
	window[cbFuncName](rData);
}*/

function validateEmail(email) {
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    if( !emailReg.test( email ) ) {
        return false;
    } else {
        return true;
    }
}