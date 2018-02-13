require 'csv'

def parseAlbums
	arr_of_arrs = CSV.read("top_100_albums.txt")
	albums = {}
	arr_of_arrs.each do |arr|
		albums[arr[0]] = arr[1]
	end
	puts albums
	albums
end