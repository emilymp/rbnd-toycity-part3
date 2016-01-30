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

  def self.find_by_title(input_title)
    product = @@products.find_index { |product| product.title == input_title }
    if product
      @@products[product]
    end
  end

  def self.in_stock
    @@products.select { |product| product.in_stock? }
  end

  def in_stock?
    @stock > 0 ? true : false
  end

  def decrement_stock
    in_stock? ? @stock -=+ 1 : false
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


