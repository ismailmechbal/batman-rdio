class Rdio.Track extends Batman.Model
  @resourceName: 'tracks'
  @storageKey: 'tracks'
  @persist Batman.RailsStorage

  @primaryKey: 'key'
  @encode 'name'

  @belongsTo 'artist', foreignKey: 'artist_key'
