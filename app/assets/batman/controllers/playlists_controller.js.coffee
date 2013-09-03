class Rdio.PlaylistsController extends Rdio.ApplicationController
  routingKey: 'playlists'
#!{before_action expect
  @beforeAction 'fetchPlaylist', only: ['show', 'edit']
#!}
  index: (params) ->
#!{playlist_index expect
    @set('playlists', Rdio.Playlist.get('all'))
#!}
  show: (params) ->

  edit: (params) ->

  new: (params) ->
#!{playlist_create expect
    @set('playlist', new Rdio.Playlist)
#!}
  create: ->
#!{playlist_create expect
    @playlist.save =>
      @redirect(@playlist)
#!}
  update: ->
#!{playlist_update expect
    @playlist.save =>
      @redirect(@playlist)
#!}
  destroy: (params) ->
#!{before_action expect
  fetchPlaylist: (params) ->
    Rdio.Playlist.find params.id, @errorHandler (list) =>
      @set('playlist', list)
#!}
