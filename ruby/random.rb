#groupメンバー
group = ["A","B","C","D","E","F"]

#グループ分けメソッド
def make_group(group,num)
  group2 = []
  while group2.size < num
  #groupからgroup2へ要素を渡す
  group2 << group.sample
  #groupからgroup2の要素を削除する
  group -= group2
  end
  p group2.sort
  p group.sort
end

# 2-4か3-3のどちらで分けるか判定する用乱数を作成する
random = rand(100)
#乱数が偶数なら、引数に(group,2)、乱数が奇数なら、引数に(group,3)を渡す。
if random % 2 == 0
  make_group(group,2)
else
  make_group(group,3)
end





