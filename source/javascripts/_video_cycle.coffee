jQuery.fn.extend
  get_active: ->
    this.filter('.active')
  activate: ->
    this.addClass('active')
  deactivate: ->
    this.removeClass('active')

random_number_between = (min, max) ->
  Math.round(Math.random() * (max - min) + min)

show_random_video = ->
  video_count = $('.videos video').length
  $active_video = $('.videos video').get_active()
  random_video_index = random_number_between(1, video_count)

  if $active_video.index() + 1 is random_video_index
    show_random_video()
  else
    $active_video.deactivate()
    $(".videos video:nth(#{random_video_index})").activate()

setInterval show_random_video, 5 * 1000
