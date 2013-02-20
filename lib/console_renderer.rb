class ConsoleRenderer
  def initialize board
    @board = board
  end

  def show
    puts board.cells.map { |line| line.join '' }.join("\n")
  end

  private

  attr_reader :board
end
