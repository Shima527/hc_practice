require_relative './Drink'
require_relative './Suica'

class VendingMachine
  DRINKS = [{name: "ペプシ", price: 150},{name: "モンスター", price: 230},{name: "いろはす", price: 130}]

  def initialize
    @stocks = []
    5.times{
      DRINKS.each{ |d|
        @stocks << Drink.new(d[:name],d[:price])
      }
    }
    @sales = 0
  end
  
  def sales
    @sales
  end

  # 在庫一覧メソッド
  def stock
    s_list = @stocks.group_by{|s| s.name}
    num = 1
    DRINKS.each{ |d|
      s_list.each{|key,value|
        if !s_list.key?(d[:name])
          print "No.#{num} 名前:#{d[:name]} 在庫:0本\n"
          num += 1
          break
        elsif d[:name] == key
          print "No.#{num} 名前:#{key} 在庫:#{value.count}本\n"
          num += 1
        end
      }
    }
  end

  def add_stock(drink)
    @stocks << drink
  end

  # 購入可能ドリンク一覧
  def drink_list
    list = []
    list = @stocks.uniq{|n|n.name}
    list.each.with_index{ |s,n|
      print "No.#{n + 1} 名前:#{s.name} 値段:#{s.price}円\n"
    }
  end

  # 在庫確認メソッド
  def stock_exist?(drink)
    bool = false

    unless drink == nil
      @stocks.each {|s|
      if s.name == drink.name
        bool = true
        break
      end
  }
    end 
    bool
  end

  # 在庫補充メソッド
  def add_drink(d_num,d_count)
    if d_num > 3
      raise "存在しない番号です"
    end

    if d_count < 1
      raise "1本以上を入力してください"
    end

    drink = DRINKS[d_num - 1]
    d_count.times{
    @stocks << Drink.new(drink[:name],drink[:price])
  }
  end

  # ドリンク購入メソッド
  def purchase(d_num,suica)
    if d_num > 3
      raise "存在しない番号です"
    end

    drink_name = DRINKS[d_num - 1][:name]
    drink = @stocks.find{|d| d.name == drink_name}  

    if !stock_exist?(drink) 
      raise "在庫がありません"
    end
      
    if !suica.charge_enough?(drink)
      raise "チャージ金額が足りません"
    end
    # 売り上げを上げる
    self.inc_sales(drink)
    # suicaのチャージ残高を減らす
    suica.purchase(drink)  

    # ドリンク在庫を減らす
    @stocks.each.with_index{|s,n|
    if s.name == drink_name
      @stocks.delete_at(n)
      break
    end
  }
  end

  private
  # 売り上げ増メソッド
  def inc_sales(drink)
    @sales += drink.price
  end   
end