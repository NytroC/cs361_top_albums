require 'sinatra'
require 'erb'
require_relative 'parse_album_list.rb'

class AlbumApp < Sinatra::Base

  get '/' do
  	@album_list = parseAlbums
   	@template = File.read('./index.erb')
   ERB.new(@template).result( binding )  
  end

end