import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tab-bar"
export default class extends Controller {

  connect() {
    console.log("Connected...")
  }

  addActiveClass(event) {
    event.currentTarget.classList.add('active');
  }
}



// const tabBar = document.querySelector('.tab-bar');

// // Add a click event listener to the entire tab bar
// tabBar.addEventListener('click', function(event) {
//   console.log("Listen click");
//   // Check if the clicked element is a tab link
//   if (event.currentTarget.classList.contains('tab-bar__nav-link')) {
//     console.log("Remove tab class");
//     // Remove the "active" class from all tab links
//     const tabLinks = tabBar.querySelectorAll('.tab-bar__nav-link');
//     tabLinks.forEach(link => link.classList.remove('active'));
//     // Add the "active" class to the clicked link
//     event.currentTarget.classList.add('active');
//   }
// });
