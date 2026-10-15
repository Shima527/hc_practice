# 規定打数を取得
shots = gets.chomp.split(",")
# プレイヤー打数を取得
p_shots = gets.chomp.split(",")

result = []

SCORE_NAMES = {
    -4 => "コンドル",
    -3 => "アルバトロス",
    -2 => "イーグル",
    -1 => "バーディ",
    0 => "パー",
    1 => "ボギー",
}

# 18ホールの結果を出力
18.times{|n|

diff = p_shots[n].to_i - shots[n].to_i 

if (shots[n] == "3" || shots[n] == "4") && p_shots[n] == "1"
    result << "ホールインワン"
    next
end

if diff > 1
    result << "#{diff}ボギー"
    next
end

result << SCORE_NAMES.fetch(diff)
}

# 結果を出力
result.map.with_index {|n,i| 
if i == 17
    print "#{n}\n"
else
    print "#{n},"
end
}