require "./AbstractList"

class Queue2 < AbstractList
	
	def initialize
	end

	def enqueue(item)
		insertBack(item)
	end

	def dequeue
		item = nil

		if empty?
			raise "Queue is empty"
		else
			item = removeFront
		end

		item
	end
end

# queue = Queue2.new

# queue.enqueue(5)
# queue.enqueue(1)
# queue.enqueue(8)
# queue.enqueue(4)
# queue.enqueue(7)

# puts queue.dequeue

# queue.to_s

