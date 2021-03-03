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
  static values = { chatroomId: String };


  send(event) {
    event.preventDefault();

    fetchWithToken(`/chatrooms/${this.chatroomIdValue}/messages`,
      {
        headers: { accept: "application/json", "Content-Type": "application/json" },
        method: "POST"
      })
      .then(response => response.json())
      .then((data) => {
      });
  }
}
