const initChat = () => {
  const chat = document.querySelector('#chat');
  if (!chat) return ;

  const chatbtn = document.querySelector('#btn-chat');
  chatbtn.addEventListener('click', () => {
    chat.classList.remove('d-none');
    console.log('coucou')
  })
  
  const close = document.querySelector('.fa-times');
  close.addEventListener('click', () => {
    chat.classList.add('d-none');
  })
}

export { initChat };