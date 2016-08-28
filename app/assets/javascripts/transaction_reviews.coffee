window.transactionReview = ->
    onCreateAjax: ->
      $('#new_transaction_review').on "ajax:success", (e, data, status, xhr) ->

