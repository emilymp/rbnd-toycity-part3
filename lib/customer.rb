class Customer
  attr_reader :name
	
  @@customers = []
	
  def initialize(op={})
    @name = op[:name]
    add_customer
  end

  def self.all
    @@customers
  end

  def self.find_by_name(input_name)
    customer = @@customers.find_index { |customer| customer.name == input_name }
    if customer
      @@customers[customer]
    end
  end

  def purchase(product)
    Transaction.new(self, product)
  end

  private

  def add_customer
    if @@customers.any? { |customer| customer.name == @name }
      raise DuplicateCustomerError, "'#{@name}' already exists."
    else
      @@customers << self
    end
  end
end
