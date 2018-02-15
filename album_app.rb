require 'erb'
require_relative 'parse_album_list'

class AlbumApp
   @@prevSort = ""
  # albums.sort_by {|_key, value| _key}.to_h
  def call(env)
    
    req = Rack::Request.new(env)
    sorting = req.params['sort_by']

    if sorting.nil?
      sorting = @@prevSort
    else 
      @@prevSort = sorting
    end
    @ind = req.params['index']
    @album_list = parseAlbums(sorting)   
        
    @template = File.read('./index.erb')
     
     # Read the data from the file.
    erb = ERB.new(@template).result( binding )
     [200, {'Content-Type' => 'text/html'}, [erb]]
  end

end