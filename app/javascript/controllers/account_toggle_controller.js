import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["signin", "signup", "signinTab", "signupTab"]

  connect() {
    this.showSignIn()
  }

  showSignIn() {
    this.signinTarget.classList.remove("d-none")
    this.signupTarget.classList.add("d-none")

    this.signinTabTarget.querySelector("span").classList.add("border-bottom", "border-dark", "fw-bold")
    this.signupTabTarget.querySelector("span").classList.remove("border-bottom", "border-dark", "fw-bold")
    this.signupTabTarget.classList.add("text-muted")
    this.signinTabTarget.classList.remove("text-muted")
  }

  showSignUp() {
    this.signupTarget.classList.remove("d-none")
    this.signinTarget.classList.add("d-none")

    this.signupTabTarget.querySelector("span").classList.add("border-bottom", "border-dark", "fw-bold")
    this.signinTabTarget.querySelector("span").classList.remove("border-bottom", "border-dark", "fw-bold")
    this.signupTabTarget.classList.remove("text-muted")
    this.signinTabTarget.classList.add("text-muted")
  }
}
