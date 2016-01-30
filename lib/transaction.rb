class Transaction
	attr_reader :customer, :product, :id

	@@transactions = []
	@@id_count = 0

	def initialize(customer, product)
		@customer = customer
		@product = product
		@id = new_id
	 	@@transactions << self
	end

	private

	def new_id
		@@id_count += 1
		@@id_count
	end


end