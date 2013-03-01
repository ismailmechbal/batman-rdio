#= require batman/es5-shim

#= require batman/batman
#= require batman/batman.rails

#= require jquery
#= require batman/batman.jquery

#= require_self

#= require_tree ./controllers
#= require_tree ./models
#= require_tree ./views
#= require_tree ./lib

Batman.extend Batman.config,
  usePushState: true
  viewPrefix: '/assets/html'

class Rdio extends Batman.App

  @resources 'artists'


  @resources 'songs'

  # @resources 'products'
  # @resources 'discounts', except: ['edit']
  # @resources 'customers', only: ['new', 'show']

  # @resources 'blogs', ->
  #   @resources 'articles'

  # @resources 'pages', ->
  #   @collection 'count'
  #   @member 'duplicate'

  # @route 'apps', 'apps#index'
  # @route 'apps/private', 'apps#private', as: 'privateApps'

  @root 'main#index'

# Tell Batman to start the app
window.Rdio = Rdio
Rdio.run()
