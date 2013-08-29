class Rdio.PlaylistsEditView extends Batman.View
  showAlbumTracks: (node, event, view) ->
    album = view.get('album')
    album.set('showTracks', !album.get('showTracks'))

  addAlbum: (node, event, view) ->
    album = view.get('album')
    playlist = view.lookupKeypath('playlist')

    album.get('tracks').forEach (track) ->
      playlist.get('tracks').add(track)

  addTrack: (node, event, view) ->
    track = view.get('track')
    playlist = view.lookupKeypath('playlist')

    playlist.get('tracks').add(track)

  searchQuery: ''
  searchResults: null
  searchRdio: ->
    @set('searchResults', null)
    @set('isSearching', true)

    Rdio.Album.search @get('searchQuery'), (error, results) =>
      @set('searchResults', results)

  clearSearch: ->
    @set('searchResults', null)
    @set('isSearching', false)
    @set('searchQuery', '')
