class Account

  def initialize(id)
    self.id = id
  end

  # このメソッドではなくattr_writerが使われているかもしれないが、
  # attr_writerも削除すること。
  def id=(value)
    @id = value
  end
end