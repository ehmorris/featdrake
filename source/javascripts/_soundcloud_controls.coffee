class Playlist
  constructor: (@widget, @songs) ->
    @index = 0
    @paused = true

  toggle_play: ->
    if @paused
      @widget.play()
      this.on_play()
    else
      @widget.pause()
      this.on_pause()

  next: ->
    if @index + 1 < @songs.length
      @index++
    else
      @index = 0

    @widget.skip(@index)
    this.on_play()

  set_title: ->
    title = @songs[@index].title
    $('title').text("#{title} ")
    $('.about h1').text("#{title} ")

  set_artist: ->
    @widget.getCurrentSound (sound) ->
      $('.about span').text("BY #{sound.user.username}")

  on_play: ->
    @paused = false
    this.set_title()
    this.set_artist()
    header_marquee.start()
    title_marquee.start()
    $('.controls').addClass('playing')

  on_pause: ->
    @paused = true
    header_marquee.pause()
    title_marquee.pause()
    $('.controls').removeClass('playing')

$ ->
  widget = SC.Widget($('.soundcloud').get(0))
  widget.bind SC.Widget.Events.READY, ->
    setup = (widget, songs) ->
      $('.controls').removeClass('inactive')
      playlist = new Playlist(widget, songs)
      $(document).on 'keyup', (key) ->
        playlist.toggle_play() if key.keyCode is 32
      $('.control.playpause').on 'click', -> playlist.toggle_play()
      $('.control.next').on 'click', -> playlist.next()
      widget.bind SC.Widget.Events.FINISH, -> playlist.next()

    widget.getSounds (songs) -> setup(widget, songs)
