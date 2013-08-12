class Rdio.Album extends Batman.Model
  @resourceName: 'albums'

  @persist Rdio.RdioStorage

  @primaryKey: 'key'
  @encode 'name', 'artist', 'icon'
  @encodeTimestamps()

  @hasMany 'tracks'

  @classAccessor 'popular', promise: (deliver) =>
    @request 'getTopCharts', data: {type: "Album", extras: "tracks"}, (error, response) ->
      popular = new Batman.Set
      popular.add(Rdio.Album.createFromJSON(album)) for album in response
      deliver(error, popular)
