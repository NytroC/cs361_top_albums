require 'erb'
require 'sinatra'
require_relative 'album_list'
class AlbumApp < Sinatra::Base
  set :albums, AlbumList.new

  get '/' do
    settings.albums.sort(params[:sort_by]) unless params[:sort_by].nil?
    settings.albums.set_highlighted_index(params[:index]) unless params[:index].nil?
    @album_list = settings.albums.get_albums
    erb :index
  end

end
