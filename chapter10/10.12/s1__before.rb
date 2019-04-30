class ProductController

	def create
		#...
		@product = if imported
			ImportedProduct.new(base_price)
		else
			if base_price > 1000
				LuxuryProduct.new(base_price)
			else
				Product.new(base_price)
			end
		end
		#...
  end

end  

class Product

  def initialize(base_price)
    @base_price = base_price
  end

  def total_price
    @base_price
  end
end

class LuxuryProduct < Product
  def total_price
    super + 0.1 * super
  end
end

class ImportedProduct < Product
  def total_price
    super + 0.25 * super
  end
end