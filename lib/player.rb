class Player
  attr_reader :name, :game, :sym

  def initialize(name)
    @name = name
  end

  def pick_symbol(sym)
    @sym = sym
  end
end
