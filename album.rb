class Album
  attr_accessor :rank
  attr_accessor :title
  attr_accessor :year
  attr_accessor :highlighted

  def initialize(rank, title, year)
    @rank = rank
    @title = title
    @year = year
    @highlighted = false
  end



end
