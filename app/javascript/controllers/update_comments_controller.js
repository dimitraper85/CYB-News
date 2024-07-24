import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-comments"
export default class extends Controller {
  static targets = ["form", "input", "output"]

  connect() {
    console.log("comments connected")
  }

  create(event) {
    event.preventDefault()
    if (this.inputTarget.value != "") {
      if (this.inputTarget.previousElementSibling.classList.contains("error-msg")) {
        this.inputTarget.style.border = "0px"
        this.inputTarget.previousElementSibling.remove()
      }
      const url = this.formTarget.action
      fetch(url, {
        method: "POST",
        headers: { "Accept": "text/plain", "credentials": "same-origin" },
        body: new FormData(this.formTarget)
      })
        .then(response => response.text())
        .then((data) => {
          this.outputTarget.innerHTML = data
        })
        this.inputTarget.value = ""
    } else {
      if (!this.inputTarget.previousElementSibling.classList.contains("error-msg")) {
      this.inputTarget.style.border = "1px solid #f8312f"
      this.inputTarget.insertAdjacentHTML("beforebegin", "<p class='error-msg' style='color:#f8312f; margin-bottom:3px;'>Please write your comment below</p>")
      }
  }
}}
