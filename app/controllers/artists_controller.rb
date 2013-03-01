class ArtistsController < ApplicationController
	respond_to :json

	def index
		@artists = Rdio.api.getTopCharts('Artist')
		respond_with artists: @artists
	end
end
