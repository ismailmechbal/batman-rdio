class Rdio.Playlist extends Batman.Model
  @resourceName: 'playlists'
  @storageKey: 'playlists'

  @persist Batman.RailsStorage

  # Use @encode to tell batman.js which properties Rails will send back with its JSON.
  # @encode 'name'
#!{encoders expect
  @encode 'name', 'icon'
#!}
  # @encodeTimestamps will automatically add encoders for created_at and updated_at.
  # They'll be decoded to JavaScript Date objects so you can easily work with them.
  @encodeTimestamps()
#!{associations expect
  @hasMany 'tracks'
#!}
