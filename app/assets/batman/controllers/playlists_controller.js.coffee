class Rdio.PlaylistsController extends Rdio.ApplicationController
  routingKey: 'playlists'

  @beforeAction 'fetchPlaylist', only: ['show', 'edit']

  index: (params) ->
#!{playlist_index
    @set('playlists', Rdio.Playlist.get('all'))
#!}
  show: (params) ->

  edit: (params) ->

  new: (params) ->
#!{playlist_create
    @set('playlist', new Rdio.Playlist)
#!}
  create: ->
#!{playlist_create
    @playlist.save =>
      @redirect(@playlist)
#!}
  update: ->
#!{playlist_update
    @playlist.save =>
      @redirect(@playlist)
#!}
  destroy: (params) ->

  fetchPlaylist: (params) ->
    Rdio.Playlist.find params.id, @errorHandler (list) =>
      @set('playlist', list)
