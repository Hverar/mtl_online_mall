// app/javascript/controllers/cart_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar"]

  connect() {
    console.log("✅ Cart controller connected")
    document.addEventListener("turbo:before-stream-render", this.handleBeforeStreamRender)
  }

  disconnect() {
    document.removeEventListener("turbo:before-stream-render", this.handleBeforeStreamRender)
  }

  toggle() {
    this.open()
  }

  open() {
    this.sidebarTarget.classList.remove("d-none")
    this.sidebarTarget.style.transform = "translateX(0)"
    localStorage.setItem("cartSidebarOpen", "true")
  }

  close(event) {
    if (event) event.stopPropagation()
    this.sidebarTarget.classList.add("d-none")
    this.sidebarTarget.style.transform = "translateX(100%)"
    localStorage.setItem("cartSidebarOpen", "false")
  }

  handleBeforeStreamRender = (event) => {
    const el = event.target
    if (!el || el.id !== "cart-sidebar-wrapper") return

    const wasOpen = localStorage.getItem("cartSidebarOpen") === "true"

    requestAnimationFrame(() => {
      const sidebar = el.querySelector("#cart-sidebar")
      if (!sidebar) return

      if (wasOpen) {
        sidebar.classList.remove("d-none")
        sidebar.style.transform = "translateX(0)"
      } else {
        sidebar.classList.add("d-none")
        sidebar.style.transform = "translateX(100%)"
      }
    })
  }
}
