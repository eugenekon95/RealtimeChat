import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {

  static targets = [ "hideable" ];

  connect() {
  }

  hideMe() {
    console.log(this.hideableTarget);
    this.hideableTarget.classList.add("hidden");
  };
}
