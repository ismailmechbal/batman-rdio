#!ignore
origin = window.opener

onMessage = (event) ->
  return unless event.source == origin

  if file = event.data.file
    if (htmlIndex = file.id.indexOf('/batman/html/')) != -1
      htmlPath = file.id.substr(htmlIndex + '/batman/html/'.length)
      htmlPath = htmlPath.substr(0, htmlPath.indexOf('.'))

      Batman.View.store.set(htmlPath, file.content)
    else
      CoffeeScript.eval(file.content)

  else if event.data == 'run'
    Rdio.run()

  else if event.data == 'reload'
    if window.location.search.indexOf('preview') == -1
      window.location += '?preview=true'
    else
      window.location.reload()

window.addEventListener 'message', onMessage, false

$ ->
  origin.postMessage('previewReady', '*')
