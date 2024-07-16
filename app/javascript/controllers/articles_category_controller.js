import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="articles-category"
export default class extends Controller {
  static targets = [ "list"]

  connect() {
    console.log(this.listTarget)
  }

  update(event) {
    event.preventDefault()
    const url = `${event.target.href}?query=${event.target.firstChild.textContent}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }
}
