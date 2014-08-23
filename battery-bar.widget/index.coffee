command: "pmset -g batt | grep \"%\" | awk 'BEGINN { FS = \";\" };{ print $1,$2,$3 }' | sed -e 's/-I/I/' -e 's/-0//' -e 's/;//' -e 's/;//'"

refreshFrequency: 5000

style: """
  top 10px
  left 335px
  color #fff
  font-family Helvetica Neue
  .widget-title
    font-size 10px
    text-transform uppercase
    font-weight bold
  .container
    height 110px
    background rgba(#000, .5)
    border-radius 5px
    padding 10px 10px 15px
  .bar-container
    background rgba(#fff, .5)
    border-radius 5px
    height 90%
    overflow hidden
    position relative
  .bar
    width: 100%
    text-align center
    vertical-align middle
    background rgba(#a1f05e, .5)
    position absolute
    bottom 0
  .value
    padding 5px 0
    font-size 10px
"""

render: -> """
<div class="container">
  <div class="widget-title">Battery</div>
  <div class="bar-container"></div>
</div>
"""

update: (output, domEl) ->
  container = $(domEl).find('.bar-container')
  values = output.split(' ')
  container.html '<div class="bar" style="height: '+values[1]+'"><div class="value">'+values[1]+'</div></div>'
