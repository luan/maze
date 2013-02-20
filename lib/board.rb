class Board
  attr_reader :cells

  def initialize map
    validate_board map
    @cells = map.chomp.lines.map do |line|
      line.chomp.split(//)
    end
  end

  private

  def validate_board map
    raise InvalidBoard if map.count("^") > 1
    raise InvalidBoard if map.empty?
    raise InvalidBoard if /[^\^\$\.#\n]/ =~ map
    raise NoEntryFound unless /\^/ =~ map
    raise NoExitFound unless /\$/ =~ map
  end

  class InvalidBoard < StandardError ; end
  class NoEntryFound < StandardError ; end
  class NoExitFound < StandardError ; end
end
