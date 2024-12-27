import { createConsumer } from "@rails/actioncable"

const consumer = createConsumer()

consumer.subscriptions.create("CommentsChannel", {
  connected() {
    console.log("Connected to CommentsChannel")
  },

  disconnected() {
    console.log("Disconnected from CommentsChannel")
  },

  received(data) {
    
    const commentsContainer = document.querySelector("#comments")
    commentsContainer.innerHTML += data
  }
})
