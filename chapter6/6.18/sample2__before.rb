class Person
  attr_accessor :name, :age

  # empty_attribute?メソッドが呼び出された時、attributeがnilかを判定すして返す
  # 例）empty_name?メソッドが呼ばれたら、name属性がnilかどうかを判定
  def method_missing(sym, *args, &block)
    empty?(sym.to_s.sub(/^empty_/, "").chomp("?"))
  end

  def empty?(sym)
    self.send(sym).nil?
  end
end