$(document).ready(function() {
  var booking = document.getElementById('new_receipt')
  if (booking) {
    var stripe = Stripe('pk_test_6pRNASCoBOKtIshFeQd4XMUh');
    var elements = stripe.elements();

    // Custom styling can be passed to options when creating an Element.
    var style = {
      base: {
        color: '#32325d',
        lineHeight: '24px',
        fontSmoothing: 'antialiased',
        fontSize: '16px',
        '::placeholder': {
          color: '#aab7c4'
        }
      },
      invalid: {
        color: '#fa755a',
        iconColor: '#fa755a'
      }
    };

    // Create an instance of the card Element
    var card = elements.create('card', {style: style});

    // Add an instance of the card Element into the `card-element` <div>
    card.mount('#card-element');


    // Create a token or display an error the form is submitted.
    var form = document.getElementById('new_receipt');
    form.addEventListener('submit', function(event) {
      event.preventDefault();

      stripe.createToken(card).then(function(result) {
        if (result.error) {
          // Inform the user if there was an error
          var errorElement = document.getElementById('card-errors');
          errorElement.textContent = result.error.message;
        } else {
          // Send the token to your server
          stripeTokenHandler(result.token);
        }
      });
    });

    function stripeTokenHandler(token) {
      // Insert the token ID into the form so it gets submitted to the server
      var form = document.getElementById('new_receipt');
      var hiddenInput = document.createElement('input');
      hiddenInput.setAttribute('type', 'hidden');
      hiddenInput.setAttribute('name', 'stripeToken');
      hiddenInput.setAttribute('value', token.id);
      form.appendChild(hiddenInput);

      // Submit the form
      form.submit();
    }

    var checkboxes = document.getElementsByClassName('event_check_box');
    var totalDisplay = document.getElementById('total');
    var total = 0;
    for (var i = 0, length = checkboxes.length; i < length; i++) {
      checkboxes[i].addEventListener('click', function(event) {
        if (event.target.checked) {
          total += parseInt(event.target.dataset.price)
        } else {
          total -= parseInt(event.target.dataset.price)
        }
        totalDisplay.textContent = '$' + total;
      });
    };
  }
});
