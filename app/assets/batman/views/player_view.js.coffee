#= require 'swfobject'

class Rdio.PlayerView extends Batman.View
	source: "player/main"

	playTrack: (track) ->
		console.log 'playing', track

	playPause: ->

	nextTrack: -> console.log 'next'

	ready: ->
		new Batman.Request
			url: '/tokens/playback.json'
			success: (data) =>
				flashVars =
					playbackToken: data.token
					domain: data.domain
					listener: this

				params =
					allowScriptAccess: true

				attributes = {}

				swfobject.embedSWF("http://www.rdio.com/api/swf", 'apiswf', 1, 1, '9.0.0', 'expressInstall.swf', flashVars, params, attributes)

				Rdio.observeAndFire 'currentTrack', @playTrack
