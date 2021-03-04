
// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//

// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

import { fetchWithToken } from "../utils/fetch_with_token"

export default class extends Controller {
  static values = { chatroomId: String, userId: Number };

  send(event) {
    event.preventDefault();
    // console.log(document.getElementById("new_message"))
    const formData = new FormData(document.getElementById("new_message"));

    fetchWithToken(`/chatrooms/${this.chatroomIdValue}/messages`,
      {
        headers: { accept: "application/json" },
        method: "POST",
        body: formData
      })
  }

  received(event) {
    const data = event.detail
    const date = {weekday: 'short', month: 'short', day: 'numeric' };
    const time = { hour: 'numeric', minute: 'numeric' };

    const is_current_user = this.userIdValue == data.user_id ? "current-user" : ""
    const message = ` <div class="message ${is_current_user}" id="<message-${data.message_id}">
        <div class="author">
          <span>${data.author}</span>
          <img class="chat-user-photo" src="http://res.cloudinary.com/ddw7wju1q/image/upload/${data.user_photo}">
        </div>
        <div class="message-content">
          <p>${data.message}</p>
          <small>${new Date().toLocaleString('en', date)} at ${new Date().toLocaleString('en', time)}</small>
        </div>
      </div>`
    const chat = document.getElementById("chat-content");
    chat.insertAdjacentHTML('beforeend', message);
    document.querySelector("#chat .message:last-child").scrollIntoView({behavior: 'smooth'})


    const input = document.getElementById("message_content");
    input.value = "";
  }
}



