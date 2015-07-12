class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @album = get_album
  end

  def edit
    @album = get_album
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to root_path
    else
      render :edit
    end
  end

    def destroy
      @album = get_album
      @album.destroy
      redirect_to root_path
    end

  private

  def album_params
    params.require(:album).permit(:title, :artist, :genre)
  end

  def get_album
    Album.find_by(id: params['id'])
  end

end
