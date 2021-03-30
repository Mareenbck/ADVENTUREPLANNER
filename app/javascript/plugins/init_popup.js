const initPopup = () => {
  const popupFrame = document.querySelector('.popupframe');
  const footer = document.querySelector('.footer');
  if (!popupFrame) return;


  const planTrip = document.querySelector('.popupbtn');
  planTrip.addEventListener('click', () => {
    popupFrame.classList.remove('d-none');
    footer.style.zIndex = "4";
  })

  const close = document.querySelector('.popupclose');
  close.addEventListener('click', () => {
    popupFrame.classList.add('d-none');
    footer.style.zIndex = "6";
  })
}

export { initPopup };
