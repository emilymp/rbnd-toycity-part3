class Product
  attr_reader :title, :price, :stock

	@@products = []
  
  def initialize(options={})
  	@title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def in_stock?
    @stock > 0 ? true : false
  end

 	private

  def add_to_products
    if @@products.any? { |product| product.title == @title }
      raise DuplicateProductError, "Product '#{@title}' already exists."    
    else
      @@products << self
    end
  end
end


