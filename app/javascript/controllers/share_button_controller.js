import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share-button"
export default class extends Controller {
  static targets = [ "options", "button" ]

  connect() {
    console.log("share buttonnn connectedddddd")
    // Add event listener to the document
    document.addEventListener("click", this.hideOptionsOnClickOutside.bind(this));
  }

  disconnect() {
    // Remove event listener when the controller is disconnected
    document.removeEventListener("click", this.hideOptionsOnClickOutside.bind(this));
  }

  toggle(event) {
    event.stopPropagation(); // Prevent the click event from bubbling up to the document
    this.optionsTarget.classList.toggle("active");
  }

  hideOptionsOnClickOutside(event) {
    // console.log("Custom Button Target:", this.buttonTarget);
    // console.log("Custom event.target:", event.target);

    if (!this.buttonTarget.contains(event.target) && !this.optionsTarget.contains(event.target)) {
      this.optionsTarget.classList.remove("active");
    }
  }
}
