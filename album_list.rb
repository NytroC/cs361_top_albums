require_relative 'generate_album_list'

class AlbumList
  attr_accessor :current_highlighted_rank
  attr_accessor :current_sort_order

  def initialize
    @albums = generate_album_list('top_100_albums.txt')
    @current_highlighted_rank = nil
    #@current_sort_order = 'rank'
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

end
