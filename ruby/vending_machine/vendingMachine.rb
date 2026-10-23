require_relative './drink'
require_relative './suica'

class VendingMachine
  DRINKS = [{name: "ペプシ", price: 150},{name: "モンスター", price: 230},{name: "いろはす", price: 130}]

  def initialize
    @stocks = []
      DRINKS.each{ |spec|
        5.times{@stocks << Drink.new(spec[:name],spec[:price]) }
      }
    @sales = 0
  end
  
  def sales
    @sales
  end

  # 在庫一覧メソッド
  def stock
    stock_list = @stocks.group_by{|s| s.name}
    num = 1

    stock_list.each do |key,value|
      print "No.#{num} 名前: #{key} 在庫: #{value.count}本\n"
      num += 1
    end
  end

  def add_stock(drink)
    @stocks << drink
  end

  # 購入可能ドリンク一覧
  def drink_list
    list = @stocks.uniq{|n|n.name}
    list.each.with_index do |s,n|
      print "No.#{n + 1} 名前:#{s.name} 値段:#{s.price}円\n"
    end
  end

  # 在庫確認メソッド
  def stock_exist?(drinks)
    drinks.size != 0
  end

  # 在庫補充メソッド
  def add_drink(drink)
    @stocks << drink
  end

  # ドリンク購入メソッド
  def purchase(drink_name,suica)
    drinks = @stocks.select{|drink| drink.name == drink_name}  
    drink = drinks[0]
    if !stock_exist?(drinks) 
      raise "在庫がありません"
    end
      
    if !suica.can_pay?(drink)
      raise "チャージ金額が足りません"
    end
    # 売り上げを上げる
    self.inc_sales(drink)
    # suicaのチャージ残高を減らす
    suica.pay(drink)  

    # ドリンク在庫を減らす
    @stocks.each.with_index do|s,n|
    if s.name == drink_name
      @stocks.delete_at(n)
      break
    end
  end
  end

  private
  # 売り上げ増メソッド
  def inc_sales(drink)
    @sales += drink.price
  end   
end