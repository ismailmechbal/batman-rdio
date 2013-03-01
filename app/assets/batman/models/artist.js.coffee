class Rdio.Artist extends Batman.Model
  @resourceName: 'artists'
  @persist Batman.RailsStorage

  @primaryKey: 'key'
  @encode 'name'

