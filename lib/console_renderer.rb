class ConsoleRenderer
  def initialize(options)
    @board = options[:board]
    @player = options[:player]
  end

  def show
    cells = board.cells
    cells[player.position.y][player.position.x] = '@' if player
    puts cells.map { |line| line.join '' }.join("\n")
  end

  private

  attr_reader :board, :player
end
