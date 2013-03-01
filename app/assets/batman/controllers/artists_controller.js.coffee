class Rdio.ArtistsController extends Rdio.ApplicationController
  routingKey: 'artists'

  index: (params) ->
  	@artists = Rdio.Artist.get('all')

  show: (params) ->

  edit: (params) ->

  create: (params) ->

  update: (params) ->

  destroy: (params) ->

