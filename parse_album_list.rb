require 'csv'

def parseAlbums(sorted_by = 'rank')
	arr_of_arrs = CSV.read("top_100_albums.txt")
	albums = {}
	arr_of_arrs.each do |arr|
		albums[arr[0]] = arr[1]
	end

	if sorted_by == 'title'
		albums = albums.sort_by {|_key, value| _key}.to_h

	elsif sorted_by == 'year'
		albums.sort_by {|_key, value| value}.to_h
	end
	albums
end