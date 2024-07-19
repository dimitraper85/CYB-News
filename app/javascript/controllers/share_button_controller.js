import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share-button"
export default class extends Controller {
  static targets = [ "options" ]

  connect() {
    console.log("share buttonnn connectedddddd")
  }

  toggle() {
    const arrayOptions = Array.from(this.optionsTarget.children)
    this.optionsTarget.classList.toggle("active")
  }
}
