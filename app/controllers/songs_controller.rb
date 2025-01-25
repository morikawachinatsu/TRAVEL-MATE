class SongsController < ApplicationController
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

  def search
    if params[:search_artist].present?
      @searchartists = RSpotify::Artist.search(params[:search_artist])
    end

    if params[:search_track].present?
      @searchtracks = RSpotify::Track.search(params[:search_track])
    end
  end

  def show
    @track = RSpotify::Track.find(params[:id])
  end

  def artist
    @artist = RSpotify::Artist.find(params[:id])
  end

  def album
    @album = RSpotify::Album.find(params[:id])
  end


  def new
    @song = Song.new
  end

  def index
      @songs = Song.all
  end

    def create
      song = Song.new(song_params)
      if song.save
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end

  private    
  def song_params
      params.require(:song).permit(:body, :apple)
  end

end
