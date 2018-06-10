ready = ->
  Typed.new '.element',
    strings: [
      "Hello! ^1000"
      "My name is"
    ]
    typeSpeed: 100,
    loop: true,
    backSpeed: 30,
    loopCount: 3
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
