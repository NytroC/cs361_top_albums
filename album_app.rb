require 'sinatra'
require 'erb'
require_relative 'parse_album_list.rb'

class AlbumApp < Sinatra::Base
 
  # albums.sort_by {|_key, value| _key}.to_h
  
  get '/' do
    @album_list = parseAlbums 'rank'
   	@template = File.read('./index.erb')
   ERB.new(@template).result( binding )  
  end

  get '/title' do
  	@album_list = parseAlbums 'title'
   	@template = File.read('./index.erb')
   ERB.new(@template).result( binding )  
  end

  get '/year' do
  	@album_list = parseAlbums 'year'
   	@template = File.read('./index.erb')
   ERB.new(@template).result( binding )  
  end

end