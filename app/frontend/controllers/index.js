import { Application } from '@hotwired/stimulus'
import { registerControllers } from 'stimulus-vite-helpers'

const application = Application.start()
// const controllers = import.meta.globEager('~/components/*/*_controller.js')


window.Stimulus = Application.start()

// const controllers = import.meta.globEager('~/controllers/*_controller.js')
// registerControllers(application, controllers)
// console.log(controllers)

const components = import.meta.globEager('~/../components/**/*_controller.js')
registerControllers(application, components)
console.log(components)
