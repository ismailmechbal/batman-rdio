class Rdio.PlayerView extends Batman.View
  source: 'player/main'

  @accessor 'isPlaying', ->
    Rdio.get('currentTrack') && @get('playState') == R.player?.PLAYSTATE_PLAYING

  @::observe 'currentPosition', (position) ->
    $(@node).find('.playhead').css('left', position + '%')

  viewDidAppear: ->
    R.ready =>
      Rdio.observe 'currentTrack', (track) ->
        if track
          R.player.play({source: track.get('key')})
        else
          R.player.stop()

      R.player.on 'change:playState', (state) =>
        @set('playState', state)

      R.player.on 'change:position', (time) =>
        duration = Rdio.get('currentTrack.duration')
        @set('currentPosition', (time / duration) * 100)

  playPause: ->
    if @get('isPlaying')
      R.player.pause()
    else
      R.player.play()
