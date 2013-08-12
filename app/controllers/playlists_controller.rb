class PlaylistsController < ApplicationController
  respond_to :json

  def index
    respond_with Playlist.limit(50)
  end

  def show
    respond_with Playlist.find(params[:id])
  end

  def create
    respond_with Playlist.create(playlist_params)
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
