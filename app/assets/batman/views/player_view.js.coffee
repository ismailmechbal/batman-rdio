#= require jquery.rdio

class Rdio.PlayerView extends Batman.View
	source: "player/main"

	@accessor 'isPlaying', ->
		Rdio.get('currentTrack') && @get('playState') == 1

	@::observe 'currentPosition', (position) ->
		$(@node).find('.playhead').css('left', position + '%')

	playPause: ->
		if @get('isPlaying')
			@rdio.pause()
		else
			@rdio.play()

	ready: ->
		new Batman.Request
			url: '/tokens/playback.json'
			success: (data) =>
				@rdioNode = $(@node).find('#player')
				@rdio = @rdioNode.rdio(data.token)

				@rdioNode.bind 'ready.rdio', =>
					Rdio.observeAndFire 'currentTrack', (track) =>
						if track
							@rdio.play(track.get('key'))
						else
							@rdio.stop()

				@rdioNode.bind 'positionChanged.rdio', (e, time) =>
					duration = Rdio.get('currentTrack.duration')
					@set 'currentPosition', (time / duration) * 100

				@rdioNode.bind 'playStateChanged.rdio', (e, state) =>
					@set 'playState', state
