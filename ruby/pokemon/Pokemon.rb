class Pokemon

  attr_reader :name,:type1,:type2,:hp
  
  def initialize(name,type1,type2,hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    print "#{@name}の攻撃！！\n"
  end
  
  private
  attr_writer :name,:type1,:type2,:hp

end

class Pikachu < Pokemon

  def initialize(name,type1,type2,hp)
    super
  end

  def attack
    super
    print "#{@name}の十万ボルト!\n"
  end
end

def main
  pika = Pikachu.new("ピカチュウ","デンキ","",100)
  pika.attack
end

main