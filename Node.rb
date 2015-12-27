class Node
	attr_accessor :data, :nextNode

	def initialize(data)
		@data = data
		@nextNode = nil

	end

	def getData
		@data
	end

	def setData(data)
		@data = data
	end

	def getNextNode
		@nextNode
	end

	def setNextNode(nextNode)
		@nextNode = nextNode
	end

	def to_s
		"#{data}"
	end

end

# newNode = Node.new('c')

# puts newNode.to_s









