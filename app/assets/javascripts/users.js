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
        
        //collect card fields
        var ccNum = $('#card_number').val(),
            ccCode = $('#card_code').val(),
            ccExpMonth = $('#card_month').val(),
            ccExpYear = $('#card_year').val();
        
        //send cc info to Stripe
        Stripe.createToken({
            number: ccNum,
            cvc: ccCode,
            exp_month: ccExpMonth,
            exp_year: ccExpYear
        }, stripeResponseHandler);
    });
    
    
});