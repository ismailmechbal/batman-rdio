class PlaylistsController < ApplicationController
  respond_to :json

  def index
    respond_with Playlist.limit(50)
  end

  def show
    respond_with Playlist.find(params[:id]), include: :tracks
  end

  def create
    respond_with Playlist.create(playlist_params)
  end

  def update
    playlist = Playlist.find(params[:id])

    playlist.update(playlist_params)

    playlist.tracks.delete_all

    for track in params[:playlist][:tracks]
      playlist.tracks.create(track_params(track))
    end

    respond_with playlist
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end

  def track_params(track)
    params = ActionController::Parameters.new(track)
    params.permit(:name, :icon, :artist, :key)
  end
end
