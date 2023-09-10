require "set"

class GraphNode
    def initialize(value)
        @value = value
        @neighbors = []
    end

    attr_reader :value
    attr_accessor :neighbors
end

def bfs(starting_node, target_value)
    visited = Set.new()
    queue = [starting_node]
    while !queue.empty?
        curr_node = queue.shift
        return curr_node if curr_node.value == target_value
        curr_node.neighbors.each do |neighbor|
            if !visited.include?(neighbor)
                queue << neighbor
                visited << neighbor
            end
        end
    end
    nil
end


a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")
p bfs(a, "f")