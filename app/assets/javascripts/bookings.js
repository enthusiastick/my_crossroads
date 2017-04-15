$(document).ready(function() {
  var booking = document.getElementById('new_receipt')
  if (booking && booking.dataset.stripePublishableKey) {
    var stripe = Stripe(booking.dataset.stripePublishableKey);
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

    card.addEventListener('change', function(event) {
      var displayError = document.getElementById('card-errors');
      var cardLabel = document.getElementById('card-label');
      if (event.error) {
        displayError.textContent = event.error.message;
        displayError.classList.add('is-visible');
        cardLabel.classList.add('is-invalid-label');
      } else {
        displayError.classList.remove('is-visible');
        cardLabel.classList.remove('is-invalid-label');
        displayError.textContent = '';
      }
    });

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
      calculateTotal();
      var amountInput = document.createElement('input');
      amountInput.setAttribute('type', 'hidden');
      amountInput.setAttribute('name', 'amount');
      amountInput.setAttribute('value', parseInt(total)*100);
      form.appendChild(amountInput);

      // Submit the form
      form.submit();
    }

    var checkboxes = document.getElementsByClassName('event_check_box');
    var totalDisplay = document.getElementById('total');
    var total;
    for (var i = 0, length = checkboxes.length; i < length; i++) {
      checkboxes[i].addEventListener('click', function(event) {
        calculateTotal();
      });
    };

    function calculateTotal() {
      var checkbox;
      total = 0;
      for (var i = 0, length = checkboxes.length; i < length; i++) {
        checkbox = checkboxes[i]
        if (checkbox.checked) {
          total += parseInt(checkbox.dataset.price)
        }
      }
      if (total == 300) {
        total -= 25;
      }
      totalDisplay.textContent = '$' + total;
    }

    var states = ['AK','AL','AR','AZ','CA','CO','CT','DC','DE','FL','GA','HI','IA','ID','IL','IN','KS','KY','LA','MA','MD','ME','MI','MN','MO','MS','MT','NC','ND','NE','NH','NJ','NM','NV','NY','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VA','VT','WA','WI','WV','WY'];
    $('#receipt_state').autocomplete({
      source: states
    });
  }
});
