require_relative '../lib/image'

describe 'Image' do

  before do
    @cols = 5
    @rows = 6
  end

  it "has 'M (cols)' x 'N (rows)' pixels" do
    bitmap = Image.new(@cols,@rows)
    expect(bitmap.cols).to eql(5)
    expect(bitmap.rows).to eql(6)
  end

  it "has initial colour of 'O'" do
    bitmap = Image.new(@cols, @rows)
    (1..@cols).map do |col|
      (1..@rows).map do |row|
        colour = bitmap.get_pixel_colour([col,row])
        expect("O").to eq(colour)
      end
    end
  end

  it "can set a pixels colour" do
    colour, pixel = "C", [1,1]
    bitmap = Image.new(@cols,@rows)
    bitmap.set_pixel_colour(pixel, colour)
    expect(bitmap.get_pixel_colour(pixel)).to eq("C")
  end

  it "returns a pixels colour" do
    expect(Image.new(@cols,@rows).set_pixel_colour([3,4], "J")).to eq("J")
  end
end
