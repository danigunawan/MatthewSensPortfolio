# Script for smooth scrolling to # anchor tags on home page
$ ->

  $('a[href^="#"]').on 'click.smoothscroll', (e) ->
    e.preventDefault()

    target = @hash
    $target = $(target)

    $('html, body').stop().animate {
      'scrollTop': $target.offset().top
    }, 500, 'swing', ->
      window.location.hash = target

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

ready = undefined
set_positions = undefined

set_positions = ->
  $('.sortable-card').each (i) ->
    $(this).attr 'data-pos', i + 1
    return
  return


ready = ->
  set_positions()
  $('.sortable').sortable()
  $('.sortable').sortable().bind 'sortupdate', (e, ui) ->
    updated_order = []
    set_positions()
    $('.sortable-card').each (i) ->
      updated_order.push
        id: $(this).data('id')
        position: i + 1
      return
    $.ajax
      type: 'PUT'
      url: '/pages/sort'
      data: order: updated_order
    return
  return



$(document).ready ready
      # this $.ajax GIVES US A DIRECT LINE OF COMMUNICATION WITH RAILS OR AN API
