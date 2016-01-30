class Transaction
	attr_reader :customer, :product, :id

	@@transactions = []
	@@id_count = 0

	def initialize(customer, product)
		@customer = customer
		@product = product
		add_transaction
	end

	def self.all
		@@transactions
	end

	def self.find(input_id)
		@@transactions[input_id - 1]
	end

	private

	def add_transaction
		if decrement_product_stock
			@id = new_id
			@@transactions << self
		else
			raise OutOfStockError, "'#{product.title}' is out of stock."
		end
	end

	def decrement_product_stock
		product.decrement_stock
	end


	def new_id
		@@id_count += 1
		@@id_count
	end
end