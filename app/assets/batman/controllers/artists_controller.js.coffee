class Rdio.ArtistsController extends Rdio.ApplicationController
  routingKey: 'artists'

  index: (params) ->
  	@set 'artists', Rdio.Artist.get 'all'

  show: (params) ->
  	@set 'artist', Rdio.Artist.find params.id, @errorHandler()

  edit: (params) ->

  create: (params) ->

  update: (params) ->

  destroy: (params) ->

