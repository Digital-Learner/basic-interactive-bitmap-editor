class Image
  attr_reader :cols, :rows

  def initialize(cols, rows)
    @cols, @rows = cols, rows
    @pixels = (1..@rows).map{ (1..@cols).map{ "O"} } #zero based array
  end

  def get_pixel_colour(pixel)
    # subtract one from each pixel co-ordinates
    # upper-left pixel has co-ordinates 1,1
    @pixels[pixel[0] - 1][pixel[1] -1 ]
  end

  def set_pixel_colour(pixel, colour)
    @pixels[pixel[0] - 1][pixel[1] - 1] = colour
  end

  def show
    @pixels.map{|row| row.join(' ') }.join("\n") + "\n"
  end

  def colour_vertical_segment(col, from_row, to_row, colour)
    (from_row..to_row).each{|row| set_pixel_colour([row, col], colour)}
  end

  def colour_horizontal_segment(from_col, to_col, row, colour)
    (from_col..to_col).each{|col| set_pixel_colour([row, col], colour)}
  end

  def get_neighbours(col,row)
    perimeter = (row -1 .. row + 1).map{|row| (col - 1 .. col + 1).map {|col| [col,row]} }
    perimeter.flatten(1) - [[col,row]]
  def get_neighbours(col, row)
    rows = (row - 1 .. row + 1).select{|row| (1..@rows).include?(row)}
    cols = (col - 1 .. col + 1).select{|col| (1..@cols).include?(col)}
    neighbours = []
    neighbours = rows.map{|row| cols.map {|col| [col,row]} }.flatten(1) - [[col,row]]
    puts "\nmy neighbours(#{col},#{row}): #{neighbours}"
    return neighbours
  end
  end
end
