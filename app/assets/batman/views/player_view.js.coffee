#= require 'swfobject'
#= require 'lib/rdio_player'

class Rdio.PlayerView extends Batman.View
	source: "player/main"

	@accessor 'isPlaying', ->
		Rdio.get('currentTrack') && @player.get('isPlaying')

	playPause: ->
		if @get('isPlaying')
			@player.pause()
		else
			@player.play()

	ready: ->
		new Batman.Request
			url: '/tokens/playback.json'
			success: (data) =>
				@set 'player', new Rdio.Player(data)

				Rdio.observeAndFire 'currentTrack', (track) =>
					if track
						@player.play(track)
					else
						@player.stop()

				@player.observe 'currentTime', (time) ->
					console.log time
					time =
					$(@node).find('.playhead').style.left = time + 'px'
