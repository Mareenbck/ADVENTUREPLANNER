import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('chat-content');

  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id}, {
      received(data) {
        const event = new CustomEvent("message-received", { detail: data })

        const chatroom = document.getElementById("chat-content")
        chatroom.dispatchEvent(event)
      }
    });
  }
}

export { initChatroomCable };
