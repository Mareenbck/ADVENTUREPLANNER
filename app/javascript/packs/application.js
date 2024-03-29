// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("chartkick")
require("chart.js")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "bootstrap-slider";
import { initTripMapbox } from '../plugins/init_trip_mapbox';
import { initMapbox } from '../plugins/init_trip_mapbox';
import { initToogleForm } from '../plugins/init_toogle_form';

import { initPopup } from '../plugins/init_popup';
import { initChat } from '../plugins/init_chat';
import { initPopupIndex } from '../plugins/init_popup_index';
import { initSwipe } from '../plugins/init_swipe';
import { initOpenWeather } from '../plugins/init_openweather';

import { initSwiper } from '../plugins/init_swiper';
import { bookingFromIndex} from '../components/booking_from_index'

import { initChatroomCable } from '../channels/chatroom_channel';


import { initStarRating } from '../plugins/init_star_rating';



import { scrollToLastMessage } from  '../components/scroll_to_last_message'
import { initAvatarMenu } from '../plugins/init_avatar_menu'



// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initTripMapbox();
  initMapbox();
  initToogleForm();
  initPopup();
  initPopupIndex();
  initSwipe();
  $("#ex2").slider({});
  initOpenWeather();
  initChat();
  bookingFromIndex();

  initSwiper();

  initChatroomCable();

  initStarRating();

  scrollToLastMessage();
  initAvatarMenu();

});


import "controllers"
