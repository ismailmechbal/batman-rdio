class Rdio.Playlist extends Batman.Model
  @resourceName: 'playlists'
  @storageKey: 'playlists'

  @persist Batman.RailsStorage

  @encode 'name', 'icon'
  @encodeTimestamps()

  @hasMany 'tracks', autoload: false
