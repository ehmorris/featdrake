center_videos = ->
  $video = $('video:first')
  $videos = $('video')

  if $video.width() > $(window).width()
    offset = ($video.width() - $(window).width()) / 2
    $videos.css({'left': "-#{offset}px", 'top': '0px'})

  else if $video.height() > $(window).height()
    offset = ($video.height() - $(window).height()) / 2
    $videos.css({'top': "-#{offset}px", 'left': '0px'})

$ ->
  setInterval(center_videos, 1000)
