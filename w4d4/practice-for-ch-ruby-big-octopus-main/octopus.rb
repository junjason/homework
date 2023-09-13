require "set"

# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
#  => "fiiiissshhhhhh"

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# # sluggish octopus
# def sluggish_octopus(arr)

# end

# p sluggish_octopus(fishes)

# dominant octopus
def dominant_octopus(arr)
    sorted = arr.sort_by(&:length)
    sorted[-1]
end

# p dominant_octopus(fishes)

# clever octopus
def clever_octopus(arr)
    longest_fish = ""
    (0...arr.length).each do |i|
        longest_fish = arr[i] if arr[i].length > longest_fish.length
    end
    longest_fish
end

# p clever_octopus(fishes)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
               "left",  "left-up"]

def slow_dance(direction, tiles_array)
    tiles_array.each_with_index do |tile, i|
        if direction == tile
            return i
        end
    end
end

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)

tiles_hash = {}
tiles_array.each_with_index do |tile, i|
    tiles_hash[tile] = i
end 

def fast_dance(direction , tiles_hash)
    tiles_hash[direction]
end

p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)
