require "./Node"

class AbstractList

	@first = nil
	@last = nil

	# def initialize
 #    	raise NotImplementedError.
 #      		new("#{self.class.name} is an abstract class.")
 #  	end

	def insertFront(item)
		node = Node.new(item)
		node.nextNode = @first
		@first = node 
	end

	def insertBack(item)
		node = Node.new(item)
		node.setNextNode(nil)

		if @last.nil?
			@first = node
		else
			@last.setNextNode(node)
		end

		@last = node
	end

	def removeFront()
		temp = @first
		@first = @first.nextNode
		temp
	end

	def empty?()
		@first.nil?
	end

	def to_s()
		puts "List (first-->last): "
		curr = @first

		while curr != nil
			puts curr.to_s()
			curr = curr.nextNode
		end
	end
	# protected :insertFront, :insertBack, :removeFront
end

# puts "Abstact List"

# list = AbstractList.new

# list.insertBack(6)
# list.insertBack(1)
# list.insertBack(3)
# list.insertBack(8)
# list.insertBack(0)

# list.removeFront
# # list.removeFront

# list.to_s


