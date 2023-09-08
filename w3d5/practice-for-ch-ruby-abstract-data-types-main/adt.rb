class Stack
    def initialize
      # create ivar to store stack here!
      s = []
    end
  
    def push(el)
      # adds an element to the stack
      s << el
    end
  
    def pop
      # removes one element from the stack
      s.pop
    end
  
    def peek
      # returns, but doesn't remove, the top element in the stack
      s[-1]
    end
end
  

class Queue
    def initialize
      # create ivar to store stack here!
      q = []
    end
  
    def enqueue
      # adds an element to the queue
      q << el
    end
  
    def dequeue
      # removes one element from the queue
      q.shift
    end
  
    def peek
      # returns, but doesn't remove, the first element in the queue
      q[0]
    end
end
  

class Map
    def initialize
      # create ivar to store stack here!
      m = []
    end
  
    def set(key, value)
      # adds a k-v pair or sets a new key value pair to map if key exists
      found = false
      m.each do |kv|
        if kv[0] == key
            found = true
            kv[1] = value
        end
      end
      if !found
        m << [key, value]
      end
    end
  
    def get(key)
      # returns value
      m.each do |kv|
        if kv[0] == key
            return kv[1]
        end
      end
      nil
    end
  
    def show
      # ?

    end
end
  
