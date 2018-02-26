require_relative 'generate_album_list'

class AlbumList
  attr_accessor :current_highlighted_rank
  attr_accessor :current_sort_order

  def initialize
    @albums = generate_album_list('top_100_albums.txt')
    @current_highlighted_index = nil
  end

  def sort(attribute = 'rank')
    @current_sort_order = attribute
    if attribute == 'rank'
      @albums = @albums.sort_by{|album| album.rank}
    elsif attribute == 'title'
      @albums = @albums.sort_by{|album| album.title}
    elsif attribute == 'year'
      @albums = @albums.sort_by{|album| album.year}
    end
  end

  def get_albums
    @albums
  end

  def set_highlighted_index(index)
    @albums.each do |album|
      if album.rank == index.to_i
        puts album.rank
        puts index
        album.highlighted = true
      else
        album.highlighted = false
      end
    end
  end

end
