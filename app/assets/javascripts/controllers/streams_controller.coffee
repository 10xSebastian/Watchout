class window.StreamsController extends Spine.Controller

  constructor: ->
    super
    do @setupOdometer
    @stream = new Stream @el.data()
    do @delegateEvents
    do @stream.start

  delegateEvents: =>
    @stream.on 'alert', => console.log 'alert'
    @stream.on 'refresh', @render

  setupOdometer: =>
    @odometer = new Odometer
      el: @el.get(0)
      value: 0
      format: Format

  render: => @odometer.update @stream.value()