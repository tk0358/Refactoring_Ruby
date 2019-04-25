module MountainBike
  TIRE_WIDTH_FACTOR = 1.5   #<= テストのために自分で設定
  FRONT_SUSPENSION_FACTOR = 2   #<= テストのために自分で設定
  REAR_SUSPENSION_FACTOR = 3   #<= テストのために自分で設定

  def initialize(params)
    params.each { |key, value| instance_variable_set "@#{key}", value}
    @commission = 0.5   #<= テストのために自分で設定
    @base_price = 100   #<= テストのために自分で設定
    @front_suspension_price = 60   #<= テストのために自分で設定
    @rear_suspension_price = 70   #<= テストのために自分で設定
  end

  def off_road_ability
    result = @tire_width * TIRE_WIDTH_FACTOR
    if @type_code == :front_suspension || @type_code == :full_suspension
      result += @front_fork_travel * FRONT_SUSPENSION_FACTOR
    end
    if @type_code == :full_suspension
      result += @rear_fork_travel * REAR_SUSPENSION_FACTOR
    end
    result
  end

  def price
    case @type_code
    when :rigid
      (1 + @commission) * @base_price
    when :front_suspension
      (1 + @commission) * @base_price + @front_suspension_price
    when :full_suspension
      (1 + @commission) * @base_price + @front_suspension_price + 
      @rear_suspension_price
    end
  end
end

class RigidMountainBike
  include MountainBike
end

class FrontSuspensionMountainBike
  include MountainBike
end

class FullSuspensionMountainBike
  include MountainBike
end



bike = RigidMountainBike.new(:type_code => :rigid, :tire_width => 2.5)
bike2 = FrontSuspensionMountainBike.new(:type_code => :front_suspension, :tire_width => 2,
          :front_fork_travel => 3)


require 'minitest/autorun'

class MountainBikeTest < Minitest::Test
  def setup
    @rigid_bike = RigidMountainBike.new(:type_code => :rigid, :tire_width => 2.5)
    @front_suspension_bike = FrontSuspensionMountainBike.new(:type_code => :front_suspension, :tire_width => 2,
      :front_fork_travel => 3)
    @full_suspension_bike = FullSuspensionMountainBike.new(:type_code => :full_suspension, :tire_width => 2,
      :front_fork_travel => 3, :rear_fork_travel => 4)    
  end

  def test_rigid_bike
    assert_equal 3.75, @rigid_bike.off_road_ability
    assert_equal 150.0, @rigid_bike.price
  end

  def test_front_suspension_bike
    assert_equal 9.0, @front_suspension_bike.off_road_ability
    assert_equal 210.0, @front_suspension_bike.price
  end

  def test_ful_suspension_bike
    assert_equal 21.0, @full_suspension_bike.off_road_ability
    assert_equal 280.0, @full_suspension_bike.price
  end
end