class ArtistsController < ApplicationController
	respond_to :json

	def index
		@artists = Rdio.api.getTopCharts('Artist')
		respond_with @artists
	end

	def show
		@artist = Rdio.api.get(params[:id], Rdio::Artist)
		respond_with @artist[0]
	end
end
