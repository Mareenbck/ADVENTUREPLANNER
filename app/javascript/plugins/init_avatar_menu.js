const initAvatarMenu = () => {
    const avatar = document.querySelector('.avatar-btn');
    if (!avatar) return ;
  
    const items = document.querySelector('.menu-log');
    avatar.addEventListener('click', () => {
        items.classList.toggle('d-none');
    });
    
  }
  
  export { initAvatarMenu};