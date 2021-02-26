const initPopup = () => {
  const popupFrame = document.querySelector('.popupframe');
  if (!popupFrame) return ;

  const planTrip = document.querySelector('.popupbtn');
  planTrip.addEventListener('click', () => {
    popupFrame.classList.remove('d-none');
  })
  
  const close = document.querySelector('.popupclose');
  close.addEventListener('click', () => {
    popupFrame.classList.add('d-none');
  })
}

export { initPopup };