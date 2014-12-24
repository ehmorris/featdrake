move_letters_left = ($text_object) ->
  text_array = $text_object.text().split('')
  first = ''
  i = 0

  while i < text_array.length
    if i is 0
      first = text_array[i]
    else
      text_array[i - 1] = text_array[i]
    i++

  text_array[text_array.length - 1] = first

  $text_object.text(text_array.join(''))

$ ->
  window.header_marquee = new MiniDaemon $('.about h1'), ->
    move_letters_left(this)
  , .25 * 1000

  window.title_marquee = new MiniDaemon $('title'), ->
    move_letters_left(this)
  , .25 * 1000
