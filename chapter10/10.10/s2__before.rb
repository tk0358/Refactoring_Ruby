class Account

  def initialize(id)
    self.id = id
  end

  def id=(value)
    @id = "ZZ#{value}"
  end
end