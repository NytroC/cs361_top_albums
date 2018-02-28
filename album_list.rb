require_relative 'generate_album_list'

class AlbumList
  attr_accessor :current_highlighted_rank
  attr_accessor :current_sort_order

  def initialize
    @albums = generate_album_list('top_100_albums.txt')
  end

  def sort(attribute = 'rank')
    @albums = @albums.sort_by{|album| album.get_attribute(attribute)}
  end

  def get_albums
    @albums
  end

  def set_highlighted_index(index)
    @albums.each do |album|
      if album.rank == index.to_i
        album.highlighted = true
      else
        album.highlighted = false
      end
    end
  end

end
