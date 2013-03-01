#= require 'swfobject'

class Rdio.PlayerView extends Batman.View
	source: "player/main"

	play: -> rdio_player.rdio_play()
	pause: -> rdio_player.rdio_pause()

	nextTrack: -> rdio_player.rdio_next()

	ready: ->
		new Batman.Request
			url: '/tokens/playback.json'
			success: (data) ->
				flashVars =
					playbackToken: data.token
					domain: data.domain
					listener: 'rdio_events'

				params =
					allowScriptAccess: 'always'

				attributes = {}

				swfobject.embedSWF("http://www.rdio.com/api/swf", 'apiswf', 1, 1, '9.0.0', 'expressInstall.swf', flashVars, params, attributes)

rdio_player = null
window.rdio_events =
	ready: ->
		rdio_player = $('#apiswf').get(0)

		Rdio.observeAndFire 'currentTrack', (track) ->
			if track
				rdio_player.rdio_play(track.get('key'))
			else
				rdio_player.rdio_stop()
