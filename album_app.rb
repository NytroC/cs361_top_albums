require 'erb'
require_relative 'parse_album_list'

class AlbumApp
 
  # albums.sort_by {|_key, value| _key}.to_h
  def call(env)
    req = Rack::Request.new(env)
    sorting = req.params['sort_by']
    @ind = req.params['index']
    puts @ind
    @album_list = parseAlbums(sorting)   
        
    @template = File.read('./index.erb')
     
     # Read the data from the file.
    erb = ERB.new(@template).result( binding )
     [200, {'Content-Type' => 'text/html'}, [erb]]
  end

end