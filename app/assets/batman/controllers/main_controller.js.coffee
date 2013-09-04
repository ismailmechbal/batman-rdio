class Rdio.MainController extends Rdio.ApplicationController
  routingKey: 'main'

  index: (params) ->

  firstName: 'Bruce'
  lastName: 'Wayne'

  @accessor 'fullName', ->
    "#{@get('firstName')} #{@get('lastName')}"
