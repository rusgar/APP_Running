import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar_add"] 
  connect() {
    setTimeout(() => {
        this.sidebar_addTarget.classList.remove('translate-x-full')
        this.sidebar_addTarget.classList.add('translate-x-0')
      }, 50)

      this.element.addEventListener("turbo:submit-end", (capture) => {
        if (capture.detail.success) {
          Turbo.visit(capture.detail.fetchResponse.response.url)
        }
      })
    
  }
  close () {
    this.sidebar_addTarget.classList.remove('translate-x-0')
    this.sidebar_addTarget.classList.add('translate-x-full')
    
    setTimeout(() => {
        this.element.parentElement.removeAttribute("src")
        this.element.remove()
      }, 500)
  }

}
