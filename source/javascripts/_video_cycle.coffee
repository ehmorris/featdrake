$(document).on 'click', (event) ->
  show_random_video()
  event.stopPropagation()

show_random_video = ->
  video_count = $('video').length
  $active_video = $('video.active')
  random_video_index = random_number_between(1, video_count)

  if $active_video.index() + 1 is random_video_index
    show_random_video()
  else
    $active_video.removeClass('active')
    $("video:nth-of-type(#{random_video_index})").addClass('active')

random_number_between = (min, max) ->
  Math.round(Math.random() * (max - min) + min)
