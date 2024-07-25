import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["navLink"]

  connect() {
    console.log("Tab bar controller connected...")
    // Show the correct page based on the active tab link
    // const activeLink = this.navLinkTargets.find((link) => link.classList.contains("active"))
    // if (activeLink) {
    //   const page = activeLink.dataset.page
    //   this.showPage(page)
    // }
  }

  selectTab(event) {
    event.preventDefault()
    this.navLinkTargets.forEach(link => link.classList.remove("active"))
    event.currentTarget.classList.add("active")
  }
}
