import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["navLink"]

  connect() {
    console.log("Tab bar controller connected...")
  }

  selectTab(event) {
    event.preventDefault()
    this.navLinkTargets.forEach(link => link.classList.remove("active"))
    event.currentTarget.classList.add("active")
  }
}
