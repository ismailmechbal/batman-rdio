#= require 'swfobject'
#= require 'lib/rdio_player'

class Rdio.PlayerView extends Batman.View
	source: "player/main"

	@accessor 'isPlaying', ->
		Rdio.get('currentTrack') && player.get('isPlaying')

	playPause: ->
		if @get('isPlaying')
			player.pause()
		else
			player.play()

	ready: ->
		new Batman.Request
			url: '/tokens/playback.json'
			success: (data) ->
				flashVars =
					playbackToken: data.token
					domain: data.domain
					listener: 'player'

				params =
					allowScriptAccess: 'always'

				attributes = {}

				swfobject.embedSWF("http://www.rdio.com/api/swf", 'apiswf', 1, 1, '9.0.0', 'expressInstall.swf', flashVars, params, attributes)
