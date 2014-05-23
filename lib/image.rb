class Image
  attr_reader :cols, :rows

  def initialize(cols, rows)
    @cols, @rows = cols, rows
    @pixels = (1..@cols).map{ (1..@rows).map{ "O"} } #zero based array
  end

  def get_pixel_colour(pixel)
    # subtract one from each pixel co-ordinates
    # upper-left pixel has co-ordinates 1,1
    @pixels[pixel[0] - 1][pixel[1] -1 ]
  end

  def set_pixel_colour(pixel, colour)
    @pixels[pixel[0] - 1, pixel[1] - 1] = colour
  end
end
