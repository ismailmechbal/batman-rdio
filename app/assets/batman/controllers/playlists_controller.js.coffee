class Rdio.PlaylistsController extends Rdio.ApplicationController
  routingKey: 'playlists'

  @beforeAction 'fetchPlaylist', only: ['show', 'edit']

  index: (params) ->
    @set('playlists', Rdio.Playlist.get('all'))

  show: (params) ->

  edit: (params) ->

  new: (params) ->
    @set('playlist', new Rdio.Playlist)

  create: ->
    @playlist.save =>
      @redirect(@playlist)

  update: (params) ->
    @redirect(@playlist)

  destroy: (params) ->

  fetchPlaylist: (params) ->
    Rdio.Playlist.find params.id, @errorHandler (list) =>
      @set('playlist', list)
