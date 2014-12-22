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
    $('.about h1').text("#{title} ")
    $('.about span').text('now playing')

  on_play: ->
    @paused = false
    this.set_title()
    marquee.start()
    $('.controls').addClass('playing')

  on_pause: ->
    @paused = true
    marquee.pause()
    $('.controls').removeClass('playing')

$ ->
  setTimeout ->
    widget = SC.Widget($('.soundcloud').get(0))
    playlist = new Object

    setup = (widget, songs) ->
      playlist = new Playlist(widget, songs)
      $('.controls .playpause').on 'click', -> playlist.toggle_play()
      $('.controls .next').on 'click', -> playlist.next()

    widget.getSounds (songs) -> setup(widget, songs)
  , 1500
