import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() { console.log('connected to turbo_modal_controller') }

    closeModal() {
        this.element.remove()
    }

    submitEndClose(event) {
        if (event.detail.success) {
            this.closeModal()
        }
    }

    clickOutsideClose(event) {
        if (this.element.contains(event.target)) {
            return
        }
        this.closeModal()
    }

}
