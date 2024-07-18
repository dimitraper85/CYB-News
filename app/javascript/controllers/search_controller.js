import { Controller } from "@hotwired/stimulus"
import { useClickOutside } from 'stimulus-use'

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["icon", "input", "title"]

  connect() {
    useClickOutside(this)
    console.log("search connected")
  }

  open() {
    this.iconTarget.classList.add("d-none")
    this.titleTarget.classList.add("d-none")
    this.inputTarget.classList.remove("d-none")
  }


  close(event) {
    this.iconTarget.classList.remove("d-none")
    this.titleTarget.classList.remove("d-none")
    this.inputTarget.classList.add("d-none")
  }
}
