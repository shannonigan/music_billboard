class SongsController < ApplicationController
  before_action :set_artist
  # before_action :set_billboard
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = @artist.songs
  end


  def show
  end


  def update
    if @songs.update(song_parmas)
      redirect_to artist_song_path(@artist, @song)
    else
      render :edit
    end
  end


  def edit
    render partial: 'form'
  end

  def new
    @songs = @artist.songs.new
    render partial: 'form'
  end


  def create
    @songs = @artist.songs.new(song_parmas)

    if @songs.save
      redirect_to artist_songs_path(@artist)
    else
      render :new
    end
  end

  def destroy
    @songs.destroy
    redirect_to artist_songs_path(@artist)
  end

  private
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @songs = Song.find(params[:id])
  end

  def song_parmas
    params.require(:song).permit(:name)
  end
end
