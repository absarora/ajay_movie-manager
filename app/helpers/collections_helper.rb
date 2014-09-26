module CollectionsHelper
  def time_convert
    format("%2d hr %02d min", @movie.length/60, @movie.length % 60 )
  end
end
