class Policy
  attr_reader :name

  def initialize(name)
    @name = name
    @rules = {}
  end

  def <<(rule)
    key = rule.attribute
    @rules[key] ||= []
    @rules[key] << rule
  end

  def apply(account)
    @rules.each do |attribute, rules|
      rules.each { |rule| rule.apply(account) }
    end
  end
end

class Rule
  attr_reader :attribute, :default_value

  def initialize(attribute,default_value)
    @attribute, @default_value = attribute, default_value
  end

  def apply(account)
    #...
  end
end