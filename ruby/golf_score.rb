# 規定打数を取得
shots = gets.chomp.split(",")
# プレイヤー打数を取得
p_shots = gets.chomp.split(",")

result = []

# 18ホールの結果を出力
18.times{|n|

if shots[n] == "5" && p_shots[n] == "1"
    result << "コンドル"
    next
end

if shots[n] == "5" && p_shots[n] == "2"
    result << "アルバトロス"
    next
end

if (shots[n] == "3" || shots[n] == "4") && p_shots[n] == "1"
    result << "ホールインワン"
    next
end

# 規定打数 - プレイヤー打数の結果を算出
sub = shots[n].to_i - p_shots[n].to_i

if sub == 1
    result << "バーディ"
elsif sub == 2 
    result << "イーグル"
elsif sub == 0
    result << "パー"
else
    b = sub * -1
    if b == 1
        result << "ボギー"
    else
        result << "#{b}ボギー"
    end
end
}

# 結果を出力
result.map.with_index {|n,i| 
if i == 17
    print "#{n}\n"
else
    print "#{n},"
end
}