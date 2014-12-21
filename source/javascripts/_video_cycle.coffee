random_number_between = (min, max) ->
  Math.round(Math.random() * (max - min) + min)

show_random_video = ->
  video_count = $('.videos video').length
  $active_video = $('.videos .active')
  random_video_index = random_number_between(1, video_count)

  if $active_video.index() + 1 is random_video_index
    show_random_video()
  else
    $active_video.removeClass('active')
    $(".videos video:nth-of-type(#{random_video_index})").addClass('active')

$ ->
  setInterval(show_random_video, 5 * 1000)
