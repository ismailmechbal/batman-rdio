class TokensController < ApplicationController
	respond_to :json

	def playback
		@token = Rdio.api.getPlaybackToken('localhost')
		respond_with token: @token, domain: 'localhost' # FIXME
	end
end
