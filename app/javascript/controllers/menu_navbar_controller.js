import { Controller } from "@hotwired/stimulus"

// Add Stimulus Use to be able to close the dropdown menu by clicking outside the menu area
import { useClickOutside } from 'stimulus-use';

// Connects to data-controller="menu-navbar"
export default class extends Controller {

  static targets = ["navbarDrop"];

  connect() {
    console.log("Hello from havbar menu controller!");
    useClickOutside(this);
  }

  toggleMenu() {
    // console.log("Hello World!!!");
    console.log(this.navbarDropTarget);
    if (this.navbarDropTarget) this.navbarDropTarget.classList.toggle("hidden");
  };

  // Function to close the menu outside the dropdown menu area if the menu visible.
  clickOutside(event) {
    let divField;

    if (document.getElementById("navbarDrop") && this.navbarDropTarget){
      divField = document.getElementById("navbarDrop");
      if (divField && this.navbarDropTarget && !divField.classList.contains('hidden'))
        this.navbarDropTarget.classList.toggle("hidden");
    };
  }
}

