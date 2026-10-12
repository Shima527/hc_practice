require 'optparse'
require 'date'

# コマンドオプションを設定
opt = OptionParser.new
opt.on('-m')

#コマンドオプションが想定外の場合、エラー
begin  
option = opt.parse!(ARGV).join
rescue => e
  puts "ERROR: #{e.message}"
  return
end

#コマンドオプション引数が1-12でなければ、エラー
if option != ""
  unless (1..12).include?(option.to_i)
    puts "#{option} is neither a month number (1..12) nor a name"
    return 
  end
end

#年、月と週を表示
today = Date.today
if option == ""
  date = Date.new(today.year,today.month)
else
  date = Date.new(today.year,option.to_i)
end
year = date.year
month = date.month

puts "     #{month.to_s}月 #{year.to_s} "
puts "月 火 水 木 金 土 日"

# スペース追加用メソッド
def add_space(n)
  spaces  =[]
  i = 0
  loop do
    break if i == n
    i += 1
    spaces <<  " "
  end
  spaces.join
end

#日付を表示
first_date = Date.new(year,month,1)
last_date = Date.new(year,month,-1)

first_date.step(last_date,1){|d| 
if d.day == 1
  case d.wday
    when 1
      print "#{d.day}#{add_space(2)}" 
    when 2
      print "#{add_space(3)}#{d.day}#{add_space(2)}" 
    when 3
      print "#{add_space(6)}#{d.day}#{add_space(2)}" 
    when 4
      print "#{add_space(9)}#{d.day}#{add_space(2)}" 
    when 5
      print "#{add_space(12)}#{d.day}#{add_space(2)}" 
    when 6
      print "#{add_space(15)}#{d.day}#{add_space(2)}" 
    when 0
      print "#{d.day}#{add_space(18)} \n"   
  end
else
  if d.wday == 0 || d.day == last_date.day
    print "#{d.day}\n"
  else
    if d.day.to_s.size == 1
      print "#{d.day}#{add_space(2)}"
    else
      print "#{d.day}#{add_space(1)}"
    end
  end
end
}

