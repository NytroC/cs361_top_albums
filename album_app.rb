require 'erb'
require_relative 'parse_album_list'

class AlbumApp
 
  # albums.sort_by {|_key, value| _key}.to_h
  def call(env)
    request = Rack::Request.new(env)

    if request.path == '/'
      @album_list = parseAlbums('rank')
      @template = File.read('./index.erb')
      [200, {'Content-Type' => 'text/html'}, [ERB.new(@template).result( binding )]]
    elsif request.path == '/year'
      @album_list = parseAlbums('year')
      @template = File.read('./index.erb')
      [200, {'Content-Type' => 'text/html'}, [ERB.new(@template).result( binding )]]
    elsif request.path == '/title'
      @album_list = parseAlbums('title')
      @template = File.read('./index.erb')
      [200, {'Content-Type' => 'text/html'}, [ERB.new(@template).result( binding )]]
    else
      [404, {'Content-Type' => 'text/html'}, ['Not Found']]
    end

  end

end