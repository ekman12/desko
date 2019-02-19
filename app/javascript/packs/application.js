
import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
initMapbox();

import { initAutocompleteAddress, initAutocompleteCity } from '../plugins/init_autocomplete.js';
initAutocompleteAddress();
initAutocompleteCity();

import { clickWishlistHeart } from '../plugins/wishlist_heart';
clickWishlistHeart();
