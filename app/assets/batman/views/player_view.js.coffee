class Rdio.PlayerView extends Batman.View
	source: 'player/main'

	@accessor 'isPlaying', ->
		Rdio.get('currentTrack') && @get('playState') == 1

	@::observe 'currentPosition', (position) ->
		$(@node).find('.playhead').css('left', position + '%')

	Rdio.observe 'currentTrack', (track) ->
		R.player.play({source: track.get('key')})

	playPause: ->
		if @get('isPlaying')
			@rdio.pause()
		else
			@rdio.play()
