
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static target = ["bookmark"];
  static values = {
    url: String
    // ^ in this case our value is a String, but you can also declare other types like Number
  }

  connect() {
    console.log("Favoritor controller connected");
    this.token = document.getElementsByName("csrf-token")[0].content

  }

  bookmark(event) {
    fetch(this.urlValue, { // Second argument allows to precise verb, headers and body
      method: "POST", // Could be dynamic with Stimulus values
      headers: { "Accept": "application/json", "X-CSRF-Token": this.token },
      // body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)

        if (data.favorited){
          this.element.innerHTML = `<i class="fa-solid fa-bookmark"></i>`;

        }
        else {
          this.element.innerHTML = `<i class="fa-regular fa-bookmark" ></i>`;
        }

    })

  }
}
