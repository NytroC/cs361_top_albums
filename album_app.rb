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
    @highlighted_list = []
    unless @ind.nil?
      @album_list.each_with_index do |(key, value), index|
        if @ind.to_i == index + 1
      		@highlighted_list.push("<p class = 'highlight'>#{index + 1}: #{key} ,#{value}</p>")
      	else
      		@highlighted_list.push("<p>#{index + 1}: #{key} ,#{value}</p>")
      	end
      end
    else
      @album_list.each_with_index do |(key, value), index|
        @highlighted_list.push("<p>#{index + 1}: #{key} ,#{value}</p>")
      end
    end


    @template = File.read('./index.erb')

     # Read the data from the file.
    erb = ERB.new(@template).result( binding )
     [200, {'Content-Type' => 'text/html'}, [erb]]
  end

end
