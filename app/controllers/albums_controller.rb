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

  def destroy
    Album.find_by(id: params['id']).destroy
    redirect_to root_path
  end

  def show
    @album = get_album
  end

  def edit
    @album = get_album
  end

  def update
    update = params['album']
    Album.update(params['id'], title: update['title'], artist: update['artist'], genre: update['genre'])
    redirect_to action: 'show'
  end

  private

  def album_params
    params.require(:album).permit(:title, :artist, :genre)
  end

  # def array_of_albums
  #   if params['selected'] == 0
  #     arr = nil
  #   else
  #     arr = params['selected'].map do |id|
  #       Album.find_by(id: id)
  #     end
  #   end
  # end

  def get_album
    @album = Album.find_by(id: params['id'])
  end

end
