import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]

  initialize() {
    console.log("Article controller initialized!")
  }

  connect() {
    console.log("Article controller connected!")
    console.log("Content target:", this.hasContentTarget)
  }

  toggle() {
    console.log("Toggle method called!")
    if (this.hasContentTarget) {
      this.contentTarget.classList.toggle("hidden")
    } else {
      console.error("Content target not found!")
    }
  }
}
