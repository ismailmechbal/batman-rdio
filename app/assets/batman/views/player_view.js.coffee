class Rdio.PlayerView extends Batman.View
	html: """
	<div class="player-controls">

	  <img data-bind-src="currentTrack.icon" />
	  <div class="playbar"><div class="playhead">x</div></div>

	  <h3 data-bind="currentTrack.name | default 'Nothing Playing'"></h3>
	  <span data-bind="currentTrack.artist"></span>
	  <span data-bind="currentTrack.album.name"></span>

	  <div class="player-controls-area">
	    <a data-event-click="playPause" data-addclass-playing="isPlaying">Play</a>
	  </div>


	  <div id="player"></div>
	</div>
	"""

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

	# ready: ->
	# 	new Batman.Request
	# 		url: '/tokens/playback.json'
	# 		success: (data) =>
	# 			@rdioNode = $(@node).find('#player')
	# 			@rdio = @rdioNode.rdio(data.token)

	# 			@rdioNode.bind 'ready.rdio', =>
	# 				Rdio.observeAndFire 'currentTrack', (track) =>
	# 					if track
	# 						@rdio.play(track.get('key'))
	# 					else
	# 						@rdio.stop()

	# 			@rdioNode.bind 'positionChanged.rdio', (e, time) =>
	# 				duration = Rdio.get('currentTrack.duration')
	# 				@set 'currentPosition', (time / duration) * 100

	# 			@rdioNode.bind 'playStateChanged.rdio', (e, state) =>
	# 				@set 'playState', state
