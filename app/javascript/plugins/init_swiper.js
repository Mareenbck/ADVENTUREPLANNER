import Swiper from 'swiper/bundle';

const initSwiper = () => {
  const swiper = new Swiper('.swiper-container', {
  // Optional parameters
  // direction: 'horizontal',
  slidesPerView: 1.2,
  centeredSlides: true,
  // spaceBetween: 20,
  loop: true,



  // // Navigation arrows
  // navigation: {
  //   nextEl: '.swiper-button-next',
  //   prevEl: '.swiper-button-prev',
  // },

  // And if we need scrollbar
  scrollbar: {
    el: '.swiper-scrollbar',
  },
  });


  swiper.on('slideChangeTransitionEnd', (event) => {
    const activeEvent = new CustomEvent("activecard", {detail: {el: event.el.querySelector(".swiper-slide-active")}});
    const map = document.querySelector("#map");
    map.dispatchEvent(activeEvent);
  })

  document.querySelectorAll('.marker').forEach((marker) => {
    marker.addEventListener('activeindex', (e) => {
      swiper.slideTo(e.detail.index + 2, 500)
    })
  })

}

export { initSwiper };
