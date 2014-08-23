###
If you have multiple cores, the percentage number might exceed 100%
That's because the percentage is represented over just 1 core
so if you have 8 cores it can get up to 800%
###


command: "ps aux  | awk 'BEGIN { sum = 0 }  { sum += $3 }; END { print sum }' && sysctl hw.ncpu | awk '{print $2}'"

refreshFrequency: 5000

style: """
  // Change bar height
  bar-height = 12px

  // Align contents left or right
  widget-align = left

  // Position this where you want

  top 90px
  left 10px
  background rgba(#000, .5)
  color #fff
  font-family Helvetica Neue
  padding 10px 10px 15px
  border-radius 5px

  .container
    width 300px

  .widget-title 
    font-size 10px

  .bar-container 
    width 100%
    background rgba(#fff, .5)
    display block
    border-radius bar-height
    margin-top 5px

  .bar
    background rgba(#fc0, .5)
    border-radius 5px
    font-size 8px
    padding 2px 10px
    
    .label
      text-align: right

"""

render: -> """
  <div class="container">
    <div class="widget-title">CPU</div>
    <div class="bar-container"><div>
  </div>
"""

update: (output, domEl) ->
  container = $(domEl).find('.bar-container')
  args = output.split('\n')

  render = (cpu,nCores) ->
    '<div class="bar" style="width:'+parseInt(cpu/nCores)+'%"><div class="label">'+cpu+'%</div></div>'
  
  container.html render(args...)
