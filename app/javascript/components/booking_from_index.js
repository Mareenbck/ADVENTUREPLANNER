const bookingFromIndex = () => {
  const container = document.querySelector('#index-container');
  if (container) {
    const fromIndex = container.dataset.fromIndex;
    const btnChat = document.getElementById('btn-chat');

    if (fromIndex) {
      btnChat.click();
    }
  }
}

export { bookingFromIndex };