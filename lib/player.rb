class Player
  attr_accessor :name, :game, :sym

  def initialize(name)
    @name = name
  end

  def pick_symbol(sym)
    @sym = sym
  end
end
