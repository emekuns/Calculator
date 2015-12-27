require "./AbstractList"

class Stack < AbstractList
	
	def initialize		
	end

	def push(item)
		insertFront(item)
	end

	def pop
		item = nil
		if empty?
			raise "Stack is empty"
		else
			item = removeFront
		end

		item
	end

	def top
		@first
	end
end

# stack = Stack.new

# stack.push(5)
# stack.push(1)
# stack.push(8)
# stack.push(4)
# stack.push(7)

# stack.pop
# stack.pop

# puts stack.top

# stack.to_s



