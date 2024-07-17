import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="articles-category"
export default class extends Controller {
  static targets = [ "list"]

  connect() {
  }

  update(event) {
    event.preventDefault()
    const url = `${event.target.href}?query=${event.params.cate}`
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data
    })
  }
}
