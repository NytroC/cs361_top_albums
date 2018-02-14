require 'erb'
require_relative 'parse_album_list'

class AlbumApp
 
  # albums.sort_by {|_key, value| _key}.to_h
  def call(env)
    # response_body = "<h1>Top 100 Albums of All Time</h1>"
    @album_list = parseAlbums('rank')
    # raw = File.read(file_path)
    # ERB.new(raw).result(binding)
    req = Rack::Request.new(env)
    puts req.params['sort_by'] 
    @template = File.read('./index.erb')
     
     # Read the data from the file.
    erb = ERB.new(@template).result( binding )
    # Append it to the response body.
    # response_body << albums.to_s
    # Send the response
     [200, {'Content-Type' => 'text/html'}, [erb]]

  end

  
  # get '/' do
  #   @album_list = parseAlbums 'rank'
  #  	@template = File.read('./index.erb')
  #   ERB.new(@template).result( binding )  
  # end

  # get '/title' do
  # 	@album_list = parseAlbums 'title'
  #  	@template = File.read('./index.erb')
  #   ERB.new(@template).result( binding )  
  # end

  # get '/year' do
  # 	@album_list = parseAlbums 'year'
  #  	@template = File.read('./index.erb')
  #  ERB.new(@template).result( binding )  
  # end

end