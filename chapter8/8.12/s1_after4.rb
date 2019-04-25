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
end

class RigidMountainBike
  include MountainBike

  def price
    (1 + @commission) * @base_price
  end

  def off_road_ability
    @tire_width * TIRE_WIDTH_FACTOR
  end
end

class FrontSuspensionMountainBike
  include MountainBike

  def price
    (1 + @commission) * @base_price + @front_suspension_price
  end

  def off_road_ability
    @tire_width * TIRE_WIDTH_FACTOR + 
    @front_fork_travel * FRONT_SUSPENSION_FACTOR
  end
end

class FullSuspensionMountainBike
  include MountainBike

  def price
    (1 + @commission) * @base_price + @front_suspension_price + 
    @rear_suspension_price
  end

  def off_road_ability
    @tire_width * TIRE_WIDTH_FACTOR +
    @front_fork_travel * FRONT_SUSPENSION_FACTOR +
    @rear_fork_travel * REAR_SUSPENSION_FACTOR
  end
end



bike = RigidMountainBike.new(:tire_width => 2.5)
bike2 = FrontSuspensionMountainBike.new(:tire_width => 2, :front_fork_travel => 3)


require 'minitest/autorun'

class MountainBikeTest < Minitest::Test
  def setup
    @rigid_bike = RigidMountainBike.new(:tire_width => 2.5)
    @front_suspension_bike = FrontSuspensionMountainBike.new(:tire_width => 2, :front_fork_travel => 3)
    @full_suspension_bike = FullSuspensionMountainBike.new(:tire_width => 2, :front_fork_travel => 3, :rear_fork_travel => 4)    
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