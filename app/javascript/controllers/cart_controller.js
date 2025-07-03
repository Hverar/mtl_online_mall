import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar"]

  connect() {
    console.log("Cart controller connected")
  }

  toggle() {
    console.log("Toggling cart sidebar")
    this.sidebarTarget.classList.toggle("d-none")
    this.sidebarTarget.style.transform = this.sidebarTarget.classList.contains("d-none")
      ? "translateX(100%)"
      : "translateX(0)"
  }

  close() {
    this.sidebarTarget.classList.add("d-none")
    this.sidebarTarget.style.transform = "translateX(100%)"
  }
}
