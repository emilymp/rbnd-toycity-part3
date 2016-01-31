class Product
  attr_reader :title, :price, :stock, :sales, :revenue

  @@products = []

  
  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    @sales = 0
    @revenue = 0
    add_to_products
  end
  
  def to_s
    "Title: #{@title} Price: \$#{@price} Stock: #{@stock} Sales: #{@sales} Revenue: \$#{@revenue}"
  end

  def in_stock?
    @stock > 0 ? true : false
  end

  def decrement_stock(discount)
    if in_stock?
        @stock -= 1
        @sales += 1
        @revenue +=  (@price - @price * discount).round(2)
        return true
    end
  end
  
  def self.all
    @@products
  end

  def self.find_by_title(input_title)
    product_index = @@products.find_index { |product| product.title == input_title }
    if product_index
      @@products[product_index]
    end
  end

  def self.in_stock
    @@products.select { |product| product.in_stock? }
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