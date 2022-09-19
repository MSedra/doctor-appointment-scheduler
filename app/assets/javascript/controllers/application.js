import { Application } from "@hotwired/stimulus"

const application = Application.start()

//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap
//= require_tree .
//= require self

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
