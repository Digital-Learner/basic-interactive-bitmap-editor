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
end
