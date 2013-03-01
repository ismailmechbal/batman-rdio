class TracksController < ApplicationController
	respond_to :json

	def index
		@tracks = if params[:artist_key]
			Rdio.api.getTracksForArtist(params[:artist_key])
		else
			Rdio.api.getTopCharts('Track')
		end

		respond_with @tracks
	end
end
