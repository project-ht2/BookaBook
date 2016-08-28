# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('[data-toggle="popover"]').popover(
    trigger: 'manual'
    html: true
    animation: false).on('mouseenter', ->
    _this = this
    $(this).popover 'show'
    $('.popover').on 'mouseleave', ->
      $(_this).popover 'hide'
      return
    return
  ).on 'mouseleave', ->
    _this = this
    setTimeout (->
      if !$('.popover:hover').length
        $(_this).popover 'hide'
      return
    ), 300
    return