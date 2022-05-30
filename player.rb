class Player
  attr_reader :name, :tag

  def initialize(name, tag)
    @name = name
    @tag = tag
    @lives = 3
  end

  def reduce_life(number)
    @lives = @lives - number
  end

  def life
    "#{@lives}/3"
  end

  def dead
    @lives == 0
  end
end