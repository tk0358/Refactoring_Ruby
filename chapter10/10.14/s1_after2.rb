class ResourceStack
  #...

  def pop
    #... # スタックが空ならEmptyStackErrorを生成する
  end
end

class ResourcePool
  def initialize
    @available = ResourceStack.new
    @allocated = ResourceStack.new
  end

  def resource
    if @available.empty?
      result = Resource.new
      @allocated.push(result)
      return result
    else
      begin
        result = @available.pop
        @allocated.push(result)
        return result
      rescue EmptyStackError
        Assert.should_never_reach_here("available was empty on pop")
        result = Resouce.new
        @allocated.push(result)
        return result
      end
    end
  end
end

class Assert
  #...

  def self.should_never_reach_here(message)
    raise message
  end
end