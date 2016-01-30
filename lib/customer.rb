class Customer
	attr_reader :name
	
	def initialize(op={})
		@name = op[:name]
	end
end
