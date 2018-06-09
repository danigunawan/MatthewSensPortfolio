ready = ->
  Typed.new '.element',
    strings: [
      "Hello!"
      "My name is"
    ]
    typeSpeed: 15
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
