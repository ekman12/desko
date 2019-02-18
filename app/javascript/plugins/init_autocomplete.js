// app/javascript/components/init_autocomplete.js
import places from 'places.js';

const initAutocompleteAddress = () => {
  const addressInput = document.getElementById('listing_location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

const initAutocompleteCity = () => {
  const addressInput = document.getElementById('query');
  if (addressInput) {
    places({
      container: addressInput,
      type: 'city'
     });
  }
};

export { initAutocompleteCity, initAutocompleteAddress };
