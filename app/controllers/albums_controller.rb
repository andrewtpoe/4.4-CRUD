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
      redirect_to action: 'index'
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
      redirect_to action: 'index'
    else
      render :edit
    end
  end

    def destroy
      Album.find_by(id: params['id']).destroy
      redirect_to root_path
    end

  private

  def album_params
    params.require(:album).permit(:title, :artist, :genre)
  end

  def get_album
    @album = Album.find_by(id: params['id'])
  end

end
