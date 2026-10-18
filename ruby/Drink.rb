class Drink
  
  def initialize(name,price)
    @name = name
    @price = price
  end

  def name
    @name
  end

  def price
    @price
  end

  def name=(name)
    @name = name
  end

  def price=(price)
    @price = price
  end
end