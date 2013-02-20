class Player
  attr_reader :position

  def initialize(options = {})
    validate_position options
    @position = Position.new options[:x], options[:y]
  end

  Position = Struct.new(:x, :y)
  class UndefinedPosition < StandardError ; end
  class PositionTypeMismatch < StandardError ; end

  private

  def validate_position(options)
    raise UndefinedPosition unless options[:x] && options[:y]
    raise PositionTypeMismatch unless options[:x].is_a?(Integer) && options[:y].is_a?(Integer)
  end
end
