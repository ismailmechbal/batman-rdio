class Rdio.PlayerView extends Batman.View
#!{view_source expect
  source: 'player/main'
#!}

#!{viewDidAppear appear
  viewDidAppear: ->
    R?.ready =>
      Rdio.observe 'currentTrack', (track) ->
        if track
          R.player.play({source: track.get('key')})
        else
          R.player.stop()

      R.player.on 'change:playState', (state) =>
        @set('playState', state)

      R.player.on 'change:position', (time) =>
        duration = Rdio.get('currentTrack.duration')
        position = (time / duration) * 100

        $('.playhead', @node).css('left', position + '%')
#!}

  playPause: ->
    if @get('isPlaying')
      R.player.pause()
    else
      R.player.play()

  @accessor 'isPlaying', ->
    Rdio.get('currentTrack') && @get('playState') == R.player?.PLAYSTATE_PLAYING
