import "bootstrap";
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';
import { French } from "flatpickr/dist/l10n/fr.js";
import ("flatpickr/dist/themes/material_green.css");

const element = document.querySelector('.datepicker')
flatpickr(element, {
  "locale": French,
  minDate: new Date().fp_incr(5),
  altInput: true,
  dateFormat: "Y-m-d",

});

const resultListDeparture = document.getElementById("resultsDeparture");
const resultListArrival = document.getElementById("resultsArrival");
const liList = document.querySelectorAll(".autocomplete-proposition");

document.addEventListener('keyup', (event) => {

  resultListDeparture.innerHTML = "";

  const inputUser = document.getElementById("search_station_departure").value;
  fetch(`API LINK ${inputUser}`)
    .then(response => response.json())
    .then((data) => {
      data.forEach((gare) => {
        const proposition = gare.category === "city" ? gare.label : null;
        if(proposition === null) {

        } else {
        const element = `<li class="autocomplete-proposition"><i class="fas fa-subway"></i> ${proposition}</li>`;
        resultList.insertAdjacentHTML("beforeend", element);
        }
      });
    });

});

document.addEventListener('keyup', (event) => {

  resultListArrival.innerHTML = "";

  const inputUser = document.getElementById("search_station_arrival").value;
  fetch(`API LINK ${inputUser}`)
    .then(response => response.json())
    .then((data) => {
      data.forEach((gare) => {
        const proposition = gare.category === "city" ? gare.label : null;
        if(proposition === null) {

        } else {
        const element = `<li class="autocomplete-proposition"><i class="fas fa-subway"></i> ${proposition}</li>`;
        resultList.insertAdjacentHTML("beforeend", element);
        }
      });
    });

});

function initSubmission(apiPK) {
  console.log(apiPK);
  // Create a Stripe client.
  var stripe = Stripe(apiPK);

  // Create an instance of Elements.
  var elements = stripe.elements();

  // Custom styling can be passed to options when creating an Element.
  // (Note that this demo uses a wider set of styles than the guide below.)
  var style = {
    base: {
      color: '#32325d',
      lineHeight: '18px',
      fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
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

  // Create an instance of the card Element.
  var card = elements.create('card', {style: style});

  // Add an instance of the card Element into the `card-element` <div>.
  card.mount('#card-element');

  // Handle real-time validation errors from the card Element.
  card.addEventListener('change', function(event) {
    var displayError = document.getElementById('card-errors');
    if (event.error) {
      displayError.textContent = event.error.message;
    } else {
      displayError.textContent = '';
    }
  });

  // Handle form submission.
  var form = document.getElementById('new_user');
  form.addEventListener('submit', function(event) {
    event.preventDefault();

    stripe.createToken(card).then(function(result) {
      if (result.error) {
        // Inform the user if there was an error.
        var errorElement = document.getElementById('card-errors');
        errorElement.textContent = result.error.message;
      } else {
        // Send the token to your server.
        stripeTokenHandler(result.token);
      }
    });
  });

};

function stripeTokenHandler(token) {
  // Insert the token ID into the form so it gets submitted to the server
  var form = document.getElementById('new_user');
  var hiddenInput = document.createElement('input');
  hiddenInput.setAttribute('type', 'hidden');
  hiddenInput.setAttribute('name', 'stripeToken');
  hiddenInput.setAttribute('value', token.id);
  form.appendChild(hiddenInput);

  // Submit the form
  form.submit();
}

global.initSubmission = initSubmission;

