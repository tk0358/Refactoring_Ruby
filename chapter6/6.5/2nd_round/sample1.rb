class Select
  def options
    @options ||= []
  end

  def and(arg)
    options << arg
    self
  end

  def self.with_option(option)
    select = self.new
    select.options << option
    select
  end
end


select = Select.with_option(1999).and(2000).and(2001).and(2002)
p select