class Album
  attr_accessor :rank
  attr_accessor :title
  attr_accessor :year

  def initialize(rank, title, year)
    @rank = rank
    @title = title
    @year = year
  end

end
