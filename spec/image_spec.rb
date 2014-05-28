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
    puts "bitmap: #{@bitmap.inspect}"
    (1..@rows).map do |row|
      (1..@cols).map do |col|
        # puts "col => #{col}, row => #{row} [get_pixel_colour(#{col}, #{row})]"
        colour = @bitmap.get_pixel_colour(col,row) # x,y
        expect("O").to eq(colour)
      end
    end
  end

  it "can set a pixels colour" do
    colour = "C"
    @bitmap.set_pixel_colour(2,3, colour)
    expect(@bitmap.get_pixel_colour(2,3)).to eq("C")
  end

  it "returns a pixels colour" do
    expect(@bitmap.get_pixel_colour(3,4)).to eq("O")
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

  # it "locates adjacent pixels" do
  #   neighbours = [ [2,3], [3,3], [4,3], [2,4], [4,4], [2,5], [3,5], [4,5] ]
  #   expect(@bitmap.get_neighbours(3,4)).to eq neighbours

  #   neighbours = [ [4,5],[5,5],[4,6] ]
  #   expect(@bitmap.get_neighbours(5,6)).to eq neighbours

  #   neighbours = [ [2,2],[3,2],[4,2],[2,3],[4,3],[2,4],[3,4],[4,4] ]
  #   expect(@bitmap.get_neighbours(3,3)).to eql neighbours
  # end

  #   # 12345  => [     pixels                                  Array access
  # # 1 JJJJJ      [[1,1,J],[2,1,J],[3,1,J],[4,1,J],[5,1,J]],            [0][0], [0][1], [0][2], [0][3], [0][4]
  # # 2 JJZZJ      [[1,2,J],[2,2,J],[3,2,J],[4,2,J],[5,2,J]],
  # # 3 JWJJJ      [[1,3,J],[2,3,W],[3,3,J],[4,3,J],[5,3,J]],
  # # 4 JWJJJ      [[1,4,J],[2,4,W],[3,4,J],[4,4,J],[5,4,J]],
  # # 5 JJJJJ      [[1,5,J],[2,5,J],[3,5,J],[4,5,J],[5,5,J]],
  # # 6 JJJJJ      [[1,6,J],[2,6,J],[3,6,J],[4,6,J],[5,6,J]]             [5][0], [5][1], [5][2], [5][3], [5][4]
  # #             ]

  it "fills region 'R' with colour 'C'" do
    bitmap = "J J J J J\nJ J J J J\nJ A J J J\nJ J J J J\nJ J J J J\nJ J J J J\n"
    @bitmap.set_pixel_colour(2,3,"A")
    @bitmap.fill(3,3,"J")
    expect(@bitmap.show).to eq bitmap

    bitmap = "J J J J J\nJ J Z Z J\nJ W J J J\nJ W J J J\nJ J J J J\nJ J J J J\n"
    @bitmap.set_pixel_colour(2,3,"A")
    @bitmap.colour_vertical_segment(2,3,4,"W")
    @bitmap.colour_horizontal_segment(3,4,2,"Z")
    @bitmap.fill(3,3,"J")
    expect(@bitmap.show).to eq bitmap
  end
end
