###
Created by Ian Hirschfeld
http://ianhirschfeld.com
https://github.com/ianhirschfeld

Extension to the Snap.svg library
http://snapsvg.io
https://github.com/adobe-webplatform/Snap.svg
###
Snap.plugin (Snap, Element, Paper, glob) ->

  ###
  Create a snap Hexagon object.
  ###
  Snap.Hexagon = {}

  ###
  Gets width of a hexagon.

  @params el {Element} A Snap Element
  @return {Number}
  ###
  Snap.Hexagon.width = (el) ->
    points = JSON.parse("[#{el.attr('points')}]")
    xs = []
    for point, i in points
      xs.push point if i % 2 is 0
    Math.max(xs...) - Math.min(xs...) + el.data('roundness')

  ###
  Gets height of a hexagon.

  @params el {Element} A Snap Element
  @return {Number}
  ###
  Snap.Hexagon.height = (el) ->
    points = JSON.parse("[#{el.attr('points')}]")
    ys = []
    for point, i in points
      ys.push point if i % 2 is 1
    Math.max(ys...) - Math.min(ys...) + el.data('roundness')

  ###
  Gets diameter of a regular hexagon.

  @params size {Number} Side length
  @return {Number}
  ###
  Snap.Hexagon.diameter = (size) ->
    size * 2

  ###
  Gets incircle radius of a regular hexagon.

  @params size {Number} Side length
  @return {Number}
  ###
  Snap.Hexagon.incircleRadius = (size) ->
    size * Math.sqrt(3) / 2

  ###
  Gets incircle diamater of a regular hexagon.

  @params size {Number} Side length
  @return {Number}
  ###
  Snap.Hexagon.incircleDiameter = (size) ->
    Snap.Hexagon.incircleRadius(size) * 2

  ###
  Draws a regular hexagon.

  @param r {Number} Radius (aka Side length)
  @param a {Number} Angle of rotation in degrees
  @param roundness {Number} Roundness of vertices
  @param originCenter {Boolean} If true, draws hexagon with center at origin
  @return {Element} A Snap Element
  ###
  Paper.prototype.hex = (r = 50, a = 0, roundness = 0, originCenter = false) ->
    points = []
    radius = r - (roundness / 2)

    # Generate hexagon points
    for i in [0..6]
      angle = i * 2 * -Math.PI / 6 + Math.degToRad(a)
      points.push radius * Math.cos(angle)
      points.push radius * Math.sin(angle)

    # Attributes needed for rounded corners
    if roundness isnt 0
      attrs =
        'stroke-width': roundness
        'stroke-linejoin': 'round'
        fill: '#000'
        stroke: '#000'

    # Create hexagon, apply attributes, and store roundness value on element
    hex = @polygon(points).attr(attrs).data('roundness', roundness)

    # Move center off of origin
    unless originCenter
      xOffset = Snap.Hexagon.width(hex) / 2
      yOffset = Snap.Hexagon.height(hex) / 2
      for i in [0..points.length-1]
        if i % 2 is 0
          points[i] += xOffset
        else
          points[i] += yOffset
      hex.attr points: points

    hex
