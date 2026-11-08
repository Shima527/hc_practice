class Suica
  DEPOSIT = 500

  attr_reader :balance
  def initialize
    @balance = DEPOSIT
  end

  # チャージ金を増やす
  def charge(amount)
    if amount < 100
      raise "100円以上をチャージしてください"
    end
    @balance += amount
  end

  def can_pay?(drink)
    @balance >= drink.price
  end

  # チャージ金を減らす(購入)
  def pay(drink)
    @balance -= drink.price
  end
end