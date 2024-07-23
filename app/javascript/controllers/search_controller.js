import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["icon", "input", "title"]

  connect() {
    console.log("search connected")
    const currentUrl = window.location.href;
    if (currentUrl.includes("query")) {
      this.iconTarget.classList.add("d-none")
      this.titleTarget.classList.add("d-none")
      this.inputTarget.classList.remove("d-none")
    }
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
    const pageUrl = window.location.href.split("?")[0]
    window.location.replace(pageUrl)

  }
}
