class Rdio.PlaylistsController extends Rdio.ApplicationController
  routingKey: 'playlists'
#!{fast_forward appear
  @beforeAction 'fetchPlaylist', only: ['show', 'edit']
#!}
  index: (params) ->
#!{playlist_index expect
    @set('playlists', Rdio.Playlist.get('all'))
#!}
  show: (params) ->

  edit: (params) ->

  new: (params) ->
#!{fast_forward appear
    @set('playlist', new Rdio.Playlist)
#!}
  create: ->
#!{fast_forward appear
    @playlist.save =>
      @redirect(@playlist)
#!}
  update: ->
#!{fast_forward appear
    @playlist.save =>
      @redirect(@playlist)
#!}
  destroy: (params) ->
#!{fast_forward appear
  fetchPlaylist: (params) ->
    Rdio.Playlist.find params.id, @errorHandler (list) =>
      @set('playlist', list)
#!}
