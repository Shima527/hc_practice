#groupメンバー
group = ["A","B","C","D","E","F"]

### 2-4で分ける場合のメソッド
def make_group(group,num)
  group2 = []
  group_num = 6

  while group2.size < num
  #乱数を作成
  random = rand(group_num)
  #groupからgroup2へメンバーを抽出する
  group2 << group.slice!(random)
  group_num -= 1
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





