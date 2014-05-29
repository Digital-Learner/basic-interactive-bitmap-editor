require_relative '../lib/bitmap_cli'

describe 'Interactive Command Line' do

  before do
    # cli is a 'command line interface'
    @cli = BitmapCLI.new
  end

  it "reads user input" do
    @cli.stub(:gets).and_return("X")
    expect(@cli.send(:get_user_input)).to eq('A')
  end

  #it "parses user input"
end
