require 'csv'
require_relative 'album'

def generate_album_list(file_name)
	file_to_array = CSV.read(file_name)
	albums = []
	file_to_array.each_with_index do |file_row, index|
		album = Album.new(index + 1, file_row[0], file_row[1])
		albums.push(album)
	end
	albums
	# if sorted_by == 'title'
	# 	albums = albums.sort_by {|_key, value| _key}.to_h
	#
	# elsif sorted_by == 'year'
	# 	albums = albums.sort_by {|_key, value| value.to_i}.to_h
	# end
	# albums
end
