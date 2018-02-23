require 'erb'
require 'sinatra'
require_relative 'album_list'

get '/' do
  album_list = AlbumList.new
  album_list.sort(params[:sort_by])
  puts params
  @album_list = album_list.get_albums
  erb :index
end
