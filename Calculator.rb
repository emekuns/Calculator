require "./AbstractList"
require "./Stack"
require "./Queue"
require "./Node"


class Calculator

	def getUserInput
		puts "Enter an infix expression: "
		val = $stdin.readline
	end

	def convertToPostfix(infix)
		postfix = Queue2.new
		opStack = Stack.new

		infix.each_byte do |c|
	  		
	  		if c.chr == ' '
	  			# Discard
	  		elsif digit?(c.chr)
	  			postfix.enqueue(c.chr)
	  		elsif c.chr == '('
	  			opStack.push(c.chr)
	  		elsif c.chr == ')'
	  			while !opStack.empty? && opStack.top != '('
					postfix.enqueue(opStack.pop)
					if !opStack.empty?
	  					opStack.pop
	  				end
	  			end
	  		else
	  			while !opStack.empty? && (priority(c.chr) <= priority(opStack.top))
	  				postfix.enqueue(opStack.pop)
	  			end
	  			opStack.push(c.chr)
			end				
		end

		while !opStack.empty?
			postfix.enqueue(opStack.pop)
		end

		postfix
	end

	def evaluate(postfix)
		evalStack = Stack.new
		
		while !postfix.empty?
			op = postfix.dequeue

			if digit?(op.getData)
				evalStack.push(op.getData.to_i)
			else
				if !evalStack.empty?
					right = evalStack.pop
				end

				if !evalStack.empty?
					left = evalStack.pop
				end
				
				if op.getData.getData == '/' || op.getData.getData == '%'
					if right.getData == 0
						raise "error: division by zero"
					else
						if op.getData.getData == '/'
							result = left.getData / right.getData
						elsif op.getData.getData == '%'
							result = left.getData % right.getData
						end
					end
				else
					if op.getData.getData == '+'
						result = left.getData + right.getData
					elsif op.getData.getData == '-'
						result = left.getData - right.getData
					elsif op.getData.getData == '*'
						result = left.getData * right.getData				
					end
					evalStack.push(result)
				end
			end
		end

		puts "Result: "
		evalStack.top.getData
	end


	def digit?(c)
		isDigit = false

		case c
		when '0'..'9'
			isDigit = true
		else
			isDigit = false
		end

		isDigit
	end

	def priority(c)
		priorityLevel = 0

		if c == '*' || c == '/' || c == '%'
			priorityLevel = 2
		elsif c == '+' || c == '-'
			priorityLevel = 1
		elsif c == '('
			priorityLevel = 0
		end

		priorityLevel
	end
end

calc = Calculator.new

val = calc.getUserInput

post = calc.convertToPostfix(val)
result = calc.evaluate(post)

puts result













