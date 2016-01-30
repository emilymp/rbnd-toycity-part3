class Transaction
	attr_reader :customer, :product, :id, :discount

	@@transactions = []
	@@id_count = 0

	def initialize(customer, product, discount=0)
		@customer = customer
		@product = product
		@discount = discount
		add_transaction
	end

	def to_s
		"#{@id} #{@customer} #{@product} #{@discount}"
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
		product.decrement_stock(@discount)
	end


	def new_id
		@@id_count += 1
		@@id_count
	end
end