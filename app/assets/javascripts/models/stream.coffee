class window.Stream extends Spine.Model

  @configure "Stream", "id"

  @extend Spine.Model.Ajax

  constructor: ->
    super
    @data = null
    do @fetch
  
  start: => 
    setInterval @fetch, Delay

  mapReduce: (func, mem)=>
    _.map @data, (datum)=>
      _.reduce datum.datapoints.slice(-@distance), func, mem

  lengths: =>
    @mapReduce ((mem) -> mem += 1), 0

  sums: =>
    @mapReduce (mem, datapoint)-> 
      mem += datapoint[0] if datapoint[0]
      mem
    , 0

  avgs: =>
    _.reduce @sums(), (mem, sum, i) ->
      mem[i] = sum / mem[i]
      mem
    , @lengths()

  values: =>
    _.map @data, (datum)-> (datum.datapoints.slice(-2)[0][0] || 0)

  value: =>
    _.reduce @values(), ((mem, value)-> mem += value), 0

  fetch: =>
    $.getJSON @url(), (data)=>
      @data = data
      @trigger 'refresh', @
      do @checkForAlert

  targets: =>
    _.map @data, (datum)=>
      datum.target

  checkForAlert: =>
    values = @values()
    targets = @targets()
    _.each @avgs(), (avg, i)=>
      if Math.abs(values[i]-avg) > @threshold*avg
        @trigger 'alert', @, 
          avg: avg
          value: values[i]
          target: targets[i]
      