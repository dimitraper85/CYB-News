import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="articles-category"
export default class extends Controller {
  static targets = [ "list"]

  connect() {
  }

  update(event) {
    event.preventDefault()
    let url = event.target.href
    if (url.includes("?")) {
     url = `${event.target.href}&category=${event.params.cate}`
    } else {
      url = `${event.target.href}?category=${event.params.cate}`
    }
    console.log(url)
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data
    })
  }
}
