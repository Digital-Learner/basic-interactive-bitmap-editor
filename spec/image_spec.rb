require_relative '../lib/image'

describe 'Image' do

  before do
    @cols = 5
    @rows = 6
    @bitmap = Image.new(@cols, @rows)
  end

  it "has 'M (cols)' x 'N (rows)' pixels" do
    expect(@bitmap.cols).to eql(5)
    expect(@bitmap.rows).to eql(6)
  end

  it "has initial colour of 'O'" do
    (1..@rows).map do |row|
      (1..@cols).map do |col|
        colour = @bitmap.get_pixel_colour([row, col])
        expect("O").to eq(colour)
      end
    end
  end

  it "can set a pixels colour" do
    colour, pixel = "C", [2,3]
    @bitmap.set_pixel_colour(pixel, colour)
    expect(@bitmap.get_pixel_colour(pixel)).to eq("C")
  end

  it "returns a pixels colour" do
    expect(@bitmap.get_pixel_colour([3,4])).to eq("O")
  end

  it "prints itself as a string" do
    bitmap = "O O O O O\nO O O O O\nO O O O O\nO O O O O\nO O O O O\nO O O O O\n"
    expect(@bitmap.show).to eq(bitmap)
  end

  it "draws a vertical segment of colour 'A' in column X between rows Y1 & Y2 (inclusive)" do
    bitmap = "O O O O O\nO O O O O\nO W O O O\nO W O O O\nO O O O O\nO O O O O\n"
    @bitmap.colour_vertical_segment(2,3,4,"W")

    expect(@bitmap.show).to eq bitmap
  end

  it "draws a horizontal segment of colour 'Z' in row Y between columns X1 & X2 (inclusive)" do
    bitmap = "O O O O O\nO O Z Z O\nO O O O O\nO O O O O\nO O O O O\nO O O O O\n"
    @bitmap.colour_horizontal_segment(3,4,2,"Z")

    expect(@bitmap.show).to eq bitmap
  end

  it "locates adjacent pixels" do
    neighbours = [[2,3], [3,3], [4,3], [2,4], [4,4], [2,5], [3,5], [4,5] ]
    expect(@bitmap.get_neighbours(3,4)).to eq neighbours
  end
end
