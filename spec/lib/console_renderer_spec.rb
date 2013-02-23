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
      renderer = ConsoleRenderer.new board: board
      renderer.show
      expect(output_stream).to eq "^..\n.#.\n..$\n"
    end

    it "displays the player" do
      output_stream = ''
      $stdout.stub(:write) { |text| output_stream << text }

      board = stub(cells: [
        ['^', '.', '.'],
        ['.', '#', '.'],
        ['.', '.', '$']
      ])
      player = stub(position: stub(x: 1, y: 0))

      renderer = ConsoleRenderer.new board: board, player: player
      renderer.show
      expect(output_stream).to eq "^@.\n.#.\n..$\n"
    end
  end
end
