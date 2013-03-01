class Player extends Batman.Object
	play: (track) -> @_player.rdio_play(track?.get('key'))
	pause: -> @_player.rdio_pause()
	stop: -> @_player.rdio_stop()

	playStateChanged: (state) ->
		@set 'isPlaying', state in [1, 3]

	ready: (user) ->
		console.log 'User', user
		@_player = $('#apiswf').get(0)

		Rdio.observeAndFire 'currentTrack', (track) =>
			if track
				player.play(track)
			else
				player.stop()

window.player = new Player
