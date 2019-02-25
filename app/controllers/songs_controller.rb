class SongsController < ApplicationController
  class SongsController < ApplicationController
    before_action :set_artist
    before_action :set_song, only: [:show, :edit, :update, :destroy]
  
    def index
      @songs = @artist.songs
      
    end
  
    def show
    end
  
    def new
      @song = @artist.songs.new
    end
  
    def edit
    end
  
    def create
      @song = @artist.songs.new(song_params)
  
      if @song.save
        redirect_to list_artist_path(@artist.list_id, @song)
      else
        render :new
      end
    end
  
    def update
      if @song.update(song_params)
        redirect_to [@artist.list_id, @song]
      else
        render :edit
      end
    end
  
    def destroy
      @song.destroy
      redirect_to list_artist_path
    end
  
    private
      def set_artist
        @artist = Artist.find(params[artist_id])
      end
  
      def set_song
        @song = Song.find(params[:id])
      end
  
      def song_params
        params.require(:song).permit(:name,)
      end
    end
  end 