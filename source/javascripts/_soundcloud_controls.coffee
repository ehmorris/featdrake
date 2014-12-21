toggle_play = (widget) ->
  widget.toggle()
  set_current_song_title(widget)
  $('.controls').toggleClass('playing')

set_current_song_title = (widget) ->
  widget.getCurrentSound (sound) ->
    $('.current_song').text(sound.title)

next_song = (widget) ->
  playlist_length = 0

  widget.getSounds (sounds) ->
    playlist_length = sounds.length

  widget.getCurrentSoundIndex (index) ->
    if index + 1 < playlist_length
      widget.next()
    else
      widget.skip(0)
    set_current_song_title(widget)

$ ->
  window.widget = SC.Widget($('.soundcloud').get(0))

  $('.controls .playpause').on 'click', ->
    toggle_play(widget)

  $('.controls .next').on 'click', ->
    next_song(widget)
