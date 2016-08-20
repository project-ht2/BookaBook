window.bookReview = ->
  {
    initBookReview: ->
      $('#rating-form').raty click: (score, evt) ->
        $('#book_review_rating').val score
        return   
      return
    initReviewRatingList: ->
      $('.review-rating').raty
        score: ->
          $(this).attr 'data-score'
        readOnly: true
      return

  }
