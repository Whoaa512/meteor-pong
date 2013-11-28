PADDLE_SPEED = 10

class Box
  constructor: (opts = {}) ->
    _.extend @, opts

    @el = document.createElement 'div'
    @el.className = 'bacon'

    document.body.appendChild @el

    Meteor.setInterval @render, 5

  render: =>
    _.extend @el.style, @twoDiemension(),
      position: 'absolute'

  twoDiemension: (obj = @)->
    left:   "#{obj.x or 0}px"
    top:    "#{obj.y or 0}px"
    height: "#{obj.h or 10}em"
    width:  "#{obj.w or 10}em"
    'background-color': obj.color ? 'pink'
    'border-radius': obj.circle ? null


@Box = Box



Meteor.isClient and Meteor.startup ->
  @paddleOne = new Box
    x: 300
    y: 500
  @ball = new Box
    x: 80
    y: 450
    color: 'blue'
    circle: '65%'

  document.onkeydown = (e)=>
    e.preventDefault()
    switch e.which
      when 40 # down
        @paddleOne.y -= PADDLE_SPEED
      when 38 # up
        @paddleOne.y += PADDLE_SPEED
