const initPopupIndex = () => {
    const popupIndex = document.querySelector('.popup-index');
    if (!popupIndex) return ;
  
    const searchIcon = document.querySelector('.fa-sliders-h');
    searchIcon.addEventListener('click', () => {
        popupIndex.classList.remove('d-none');
    })
    
    const close = document.querySelector('.fa-times');
    close.addEventListener('click', () => {
      popupIndex.classList.add('d-none');
    })
  }
  
  export { initPopupIndex };