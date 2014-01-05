Snap.svg-Plugins
================

Plugins to extend the functionality of the Snap.svg Javascript library.


Hexagon
-------

- `Snap.Hexagon.width(el)`
- `Snap.Hexagon.height(el)`
- `Snap.Hexagon.diameter(size)`
- `Snap.Hexagon.incircleRadius(size)`
- `Snap.Hexagon.incircleDiameter(size)`


```CoffeeScript
###
Draws a regular hexagon.

@param r {Number} Radius (aka Side length)
@param a {Number} Angle of rotation in degrees
@param roundness {Number} Roundness of vertices
@param attrs {Object} Element attributes
@param center {Boolean} If true, draws hexagon with center at [0,0]
@return {Element} A Snap Element
###
Paper.hex(r = 50, a = 0, roundness = 0, attrs = {}, center = false)
```
