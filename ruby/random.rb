#groupメンバー
group = ["A","B","C","D","E","F"]

#グループ分けメソッド
def make_group(group)
  group2 = []
  #groupからgroup2へ要素を渡す
  group2 = group.sample(rand(2..3))
  #groupからgroup2の要素を削除する
  group -= group2
  p group2.sort
  p group.sort
end

make_group(group)





