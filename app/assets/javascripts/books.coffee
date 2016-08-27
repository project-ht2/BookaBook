$(document).on 'turbolinks:load', ->
  $this = undefined
  $('#masonry-container').imagesLoaded ->
    $('#masonry-container').masonry
      itemSelector: '.small-book-block'
      isFitWidth: true
  $('a[data-toggle=tab]').each ->
  $this = $(this)
  $this.on 'shown.bs.tab', ->
    $('.masonry-container').imagesLoaded ->
      $('.masonry-container').masonry
        itemSelector: '.small-book-block'
        isFitWidth: true
      return
    return
  return