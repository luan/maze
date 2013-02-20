require './lib/console_renderer'

describe ConsoleRenderer do
  describe "#show" do
    it "displays the board" do
      output_stream = ''
      $stdout.stub(:write) { |text| output_stream << text }

      board = stub(cells: [
        ['^', '.', '.'],
        ['.', '#', '.'],
        ['.', '.', '$']
      ])
      renderer = ConsoleRenderer.new board
      renderer.show
      expect(output_stream).to eq "^..\n.#.\n..$\n"
    end
  end
end
