
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new { Array.new }
    i = 0
    while i < 14
      if i == 6 || i == 13
        cups[i] = []
      else
        cups[i] = place_stones
      end
      i+=1
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    stones = []
    4.times do 
      stones << :stone
    end
    stones
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
      raise RuntimeError.new("Invalid starting cup")
    end
    if @cups[start_pos].empty?
      raise RuntimeError.new("Starting cup is empty")
    end
  end

  def make_move(start_pos, current_player_name)
    skip_i = nil
    players_i = nil
    if current_player_name == @name1
      skip_i = 13
      players_i = 6
    else
      skip_i = 6
      players_i = 13
    end

    picked_up = @cups[start_pos]
    @cups[start_pos] = []
    while picked_up.length > 0
      start_pos += 1
      if start_pos > @cups.length
        start_pos = start_pos % @cups.length
      end
      if start_pos != skip_i
        next_stone = picked_up.pop
        @cups[start_pos] << next_stone
      end
    end
    render
    next_turn(start_pos)
    if @cups[start_pos].length == 0
      return :switch
    elsif start_pos == players_i
      return :prompt
    elsif !@cups[start_pos].empty?
      return start_pos
    end

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end