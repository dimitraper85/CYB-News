import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share-button"
export default class extends Controller {
  static targets = [ "options" ]

  connect() {
    console.log("share buttonnn connectedddddd")
  }

  toggle() {
    console.log("Clicked")
    const arrayOptions = Array.from(this.optionsTarget.children)
    console.log(this.optionsTarget)
    // console.log(arrayOptions)
    // arrayOptions.forEach ( (option) => {
    //   option.classList.toggle("active")
    // } )
    this.optionsTarget.classList.add("active")
  }
}
