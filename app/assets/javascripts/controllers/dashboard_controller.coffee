class window.DashboardController extends Spine.Controller

  constructor: ->
    super
    for el in @el.find("[data-type='number']")
      new StreamsController el: el