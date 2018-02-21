class AlbumList
  attr_accessor :current_highlighted_rank
  attr_accessor :current_sort_order

  def initialize(albums)
    @albums = albums
    @current_highlighted_rank = nil
    @current_sort_order = 'rank'
  end

  def sort(attribute)
    @current_sort_order = attribute
    @albums.sort_by(attribute)
  end



end
