class Rdio.Track extends Batman.Model
  @resourceName: 'tracks'
  @storageKey: 'tracks'
  @persist Batman.RailsStorage

  @primaryKey: 'key'
  @encode 'name', 'duration', 'icon'

  @belongsTo 'artist', foreignKey: 'artist_key'

  play: ->
  	Rdio.set 'currentTrack', this
