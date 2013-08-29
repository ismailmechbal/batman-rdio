class Rdio.Track extends Batman.Model
  @resourceName: 'tracks'
  @storageKey: 'tracks'

  @persist Rdio.RdioStorage

  @primaryKey: 'key'
  @encode 'name', 'duration', 'icon', 'artist', 'key'

  @belongsTo 'album', foreignKey: 'album_key'

  play: ->
    Rdio.set 'currentTrack', this
