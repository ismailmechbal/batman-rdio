#= require batman/es5-shim

#= require batman/batman
#= require batman/batman.rails

#= require jquery
#!{jquery_ui appear
#= require jquery.ui.sortable
#!}
#= require batman/batman.jquery

#= require_self

#= require_tree ./lib
#= require_tree ./controllers
#= require_tree ./models
#= require_tree ./views

Batman.config.pathToHTML = '/assets/html'

class Rdio extends Batman.App
  @resources 'playlists'
#!{tracks_scaffold appear
  @resources 'tracks'
#!}
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

  @root 'playlists#index'

(global ? window).Rdio = Rdio
