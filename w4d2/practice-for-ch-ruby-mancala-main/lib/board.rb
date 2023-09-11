
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

    picked_up = @cups[start_pos].dup
    @cups[start_pos] = []

    while !picked_up.empty?
      start_pos += 1

      start_pos = start_pos % @cups.length if start_pos >= @cups.length

      if start_pos != skip_i
        @cups[start_pos] << picked_up.pop
      end
    end

    render
    next_turn(start_pos)

    if start_pos != players_i && start_pos != skip_i && @cups[start_pos].length == 1
      return :switch
    elsif start_pos == players_i
      return :prompt
    elsif start_pos != players_i && start_pos != skip_i && !@cups[start_pos].empty?
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
    if @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
      return true
    end
    false
  end

  def winner
   
      if @cups[6].length == @cups[13].length
        return :draw
      else
        if @cups[6].length > @cups[13].length
          return @name1
        else
          return @name2
        end
      end
   

  end
end