class Suica
  DEPOSIT = 500

  def initialize
    @charge = DEPOSIT
  end

  def charge
    @charge
  end

  # チャージ金を増やす
  def do_charge(amount)
    if amount < 100
      raise "100円以上をチャージしてください"
    end
    @charge += amount
  end

  def charge_enough?(drink)
    bool = false
    if @charge >= drink.price
      bool = true
    end
    bool
    
  end

  # チャージ金を減らす(購入)
  def purchase(drink)
    self.dec_charge(drink.price)
  end

  private
  def dec_charge(amount)
    @charge -= amount
  end
end