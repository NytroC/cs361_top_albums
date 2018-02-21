require 'erb'
require_relative 'sort_album_list'

class AlbumApp
  def initialize
    @stored_sorting_state = ''
  end
  # albums.sort_by {|_key, value| _key}.to_h
  def call(env)

    req = Rack::Request.new(env)
    sorting_method = req.params['sort_by']

    if sorting_method.nil?
      sorting_method = @stored_sorting_state
    else
      @stored_sorting_state = sorting_method
    end
    @selected_index = req.params['index']
    @album_list = sort_albums(sorting_method)
    @highlighted_list = []
    unless @selected_index.nil?
      @album_list.each_with_index do |(key, value), index|
        if @selected_index.to_i == index + 1
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
