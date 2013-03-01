class Rdio.Player extends Batman.Object
	constructor: (data) ->
		super()
		window.rdio_player = this

		flashVars =
			playbackToken: data.token
			domain: data.domain
			listener: 'rdio_player'

		params =
			allowScriptAccess: 'always'

		attributes = {}

		swfobject.embedSWF("http://www.rdio.com/api/swf", 'apiswf', 1, 1, '9.0.0', 'expressInstall.swf', flashVars, params, attributes)

	play: (track) -> @_rdio?.rdio_play(track?.get('key'))
	pause: -> @_rdio?.rdio_pause()
	stop: -> @_rdio?.rdio_stop()

	playStateChanged: (state) ->
		@set 'isPlaying', state in [1, 3]

	positionChanged: (position) ->
		@set 'currentTime', position

	ready: (user) ->
		@set 'user', user
		@_rdio = $('#apiswf').get(0)

	playingTrackChanged: ->
		console.log arguments
