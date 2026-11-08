require_relative './suica'
require_relative './drink'
require_relative './vendingMachine'

def back_to_first?
  print "機能一覧に戻りますか？[Y/n]"
  ch = gets.chomp
  print "\n"
  bool = false

  if ch == 'Y' || ch == 'y'
    bool = true
  end
  bool
end

suica = Suica.new
vm = VendingMachine.new

loop {
print "----------------------------\n"
print "機能一覧\n"
print "----------------------------\n"
print "1: Suica チャージ残高確認\n"
print "2: Suica チャージ\n"
print "3: 自販機 在庫確認\n"
print "4: 自販機 購入可能ドリンクリスト\n"
print "5: 自販機 売上金額確認\n"
print "6: 自販機 在庫補充\n"
print "7: ドリンク購入\n"
print "8: 終了\n"
print "----------------------------\n"
print  "機能を選択してください: "
ch = gets.chomp
print "\n"

if ch == '1'
  loop {
    print "---Suica チャージ残高確認------------\n"
    print "\n"
    print "#{suica.balance}円\n"
    print "\n"
    print "----------------------------\n"
    if back_to_first?
      break
    else
      redo
    end
  }
elsif ch == '2'
  loop {
  print "---Suica チャージ------------\n"
  print "チャージする金額を入力してください: "
  amount = gets.chomp
  begin
  suica.charge(amount.to_i)
  rescue => e
    puts e.message
    if back_to_first?
      break
    else
      redo
    end
  end
  print "チャージが完了しました。\n"
  print "----------------------------\n"
  if back_to_first?
      break
  else
      redo
  end
}
elsif ch == '3'
  loop {
  print "---自販機 在庫確認------------\n"
    vm.stock
  print "------------------------------\n"
  if back_to_first?
      break
  else
      redo
  end
  }
elsif ch == '4'
  loop {
  print "---自販機 購入可能リスト------------\n"
    vm.drink_list
  print "------------------------------\n"
  if back_to_first?
      break
  else
      redo
  end
}
elsif ch == '5'
  loop {
  print "---自販機 売上金確認------------\n"
  print "#{vm.sales}円\n"
  print "------------------------------\n"
  if back_to_first?
      break
  else
      redo
  end
}
elsif ch == '6'
    loop {
  print "---自販機 在庫補充------------\n"
  print "------------------------------\n"
  print "補充するドリンク名してください:"
  drink_name = gets.chomp
  print "値段を入力してください:"
  price = gets.chomp
  print "補充する本数を入力してください:"
  drink_count = gets.chomp
  
  if drink_count.to_i < 1
    print "1本以上を入力してください"

  if back_to_first?
    break
  else
    redo
  end
  end

  drink_count.to_i.times do
  drink = Drink.new(drink_name,price.to_i)
  vm.add_drink(drink)
  end
  print "在庫補充が完了しました\n"
  print "------------------------------\n"

  if back_to_first?
      break
  else
      redo
  end
}
elsif ch == '7'
  loop{
    print "---ドリンク購入------------\n"
  #   num = 1
  #   VendingMachine::DRINKS.each{|d|
  #     print "No.#{num} 名前:#{d[:name]} 値段: #{d[:price]}\n"
  #     num += 1
  # }
    print "------------------------------\n"
    print "購入するドリンクの名前を入力してください:"
    drink_name = gets.chomp

    begin 
    vm.purchase(drink_name,suica)
    rescue => e
      puts e.message

    if back_to_first?
      break
    else
      redo
    end
    end
    print "購入が完了しました\n"

    if back_to_first?
      break
    else
      redo
    end
    
    print "------------------------------\n"
  }
elsif ch == '8'
  break
end

}

