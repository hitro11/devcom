/* global $, Stripe */

//doc ready
$(document).on('turbolinks:load', function() {
    
    var theForm = $('#pro_form');
    var submitBtn = $('#form-submit-btn');
    
    //set stripe public key
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
    
    // when user clicks submit button
    submitBtn.click(function(event) {
        
        //prevent default submission behavior
        event.preventDefault();
        submitBtn.val("Processing...").prop('disabled', true);
        
        //collect card fields
        var ccNum = $('#card_number').val(),
            ccCode = $('#card_code').val(),
            ccExpMonth = $('#card_month').val(),
            ccExpYear = $('#card_year').val();
            
        //error handling
        var error = false;
        if (!Stripe.card.validateCardNumber(ccNum) ||
        !Stripe.card.validateCVC(ccCode) ||
        !Stripe.card.validateExpiry(ccExpMonth, ccExpYear))
        {
            error = true;
            alert("Credit card details are invalid")
        }
       
        if (error) {
            submitBtn.prop('disabled', false).val("Sign Up");
        } 
        else {
            
             //send cc info to Stripe
            Stripe.createToken({
            number: ccNum,
            cvc: ccCode,
            exp_month: ccExpMonth,
            exp_year: ccExpYear
            },  stripeResponseHandler);
        }
        
        return false;
    });
    
    
    //stripe will return token
    function stripeResponseHandler(status, response) {
        //get token from the response
        var token = response.id;
        
        //inject token in hidden field of form
        theForm.append( $('<input type="hidden" name="user[stripe_card_token]">').val(token) );
        
        //submit form to server
         theForm.get(0).submit();
    }
    
});