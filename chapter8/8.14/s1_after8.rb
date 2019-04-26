require 'forwardable'

class MountainBike
  TIRE_WIDTH_FACTOR = 1.5   #<= テストのために自分で設定
  FRONT_SUSPENSION_FACTOR = 2   #<= テストのために自分で設定
  REAR_SUSPENSION_FACTOR = 3   #<= テストのために自分で設定

  extend Forwardable
  def_delegators :@bike_type, :off_road_ability, :price

  def initialize(bike_type)
    @bike_type = bike_type
  end

  def add_front_suspension(params)
    @bike_type = FrontSuspensionMountainBike.new(
      @bike_type.upgradable_parameters.merge(params)
    )
  end

  def add_rear_suspension(params)
    unless @bike_type.is_a?(FrontSuspensionMountainBike)
      raise "You can't add rear suspension unless you have front suspension"
    end
    @bike_type = FullSuspensionMountainBike.new(
      @bike_type.upgradable_parameters.merge(params)
    )
  end

end

class RigidMountainBike

  def initialize(params)
    @tire_width = params[:tire_width]
    @base_price = params[:base_price]
    @commission = params[:commission]
  end

  def off_road_ability
    @tire_width * MountainBike::TIRE_WIDTH_FACTOR
  end

  def price
    (1 + @commission) * @base_price
  end

  def upgradable_parameters
    {
      :tire_width => @tire_width,
      :base_price => @base_price,
      :commission => @commission
    }
  end

end

class FrontSuspensionMountainBike

  def initialize(params)
    @tire_width = params[:tire_width]
    @front_fork_travel = params[:front_fork_travel]
    @front_suspension_price = params[:front_suspension_price]
    @base_price = params[:base_price]
    @commission = params[:commission]
  end

  def off_road_ability
    @tire_width * MountainBike::TIRE_WIDTH_FACTOR + 
    @front_fork_travel * MountainBike::FRONT_SUSPENSION_FACTOR
  end

  def price
    (1 + @commission) * @base_price + @front_suspension_price
  end

  def upgradable_parameters
    {
      :tire_width => @tire_width,
      :front_fork_travel => @front_fork_travel,
      :front_suspension_price => @front_suspension_price,
      :base_price => @base_price,
      :commission => @commission
    }
  end
end

class FullSuspensionMountainBike

  def initialize(params)
    @tire_width = params[:tire_width]
    @front_fork_travel = params[:front_fork_travel]
    @rear_fork_travel = params[:rear_fork_travel]
    @front_suspension_price = params[:front_suspension_price]
    @rear_suspension_price = params[:rear_suspension_price]
    @base_price = params[:base_price]
    @commission = params[:commission]
  end

  def off_road_ability
    @tire_width * MountainBike::TIRE_WIDTH_FACTOR + 
    @front_fork_travel * MountainBike::FRONT_SUSPENSION_FACTOR +
    @rear_fork_travel * MountainBike::REAR_SUSPENSION_FACTOR
  end

  def price
    (1 + @commission) * @base_price + @front_suspension_price +
    @rear_suspension_price
  end

end

require 'minitest/autorun'

class MountainBikeTest < Minitest::Test
  def setup
    @bike = MountainBike.new(RigidMountainBike.new(:tire_width => 2.5, 
      :commission => 0.5, :base_price => 100)) 
  end

  def test_rigid_bike
    assert_equal 3.75, @bike.off_road_ability
    assert_equal 150.0, @bike.price
  end

  def test_front_suspension_bike
    @bike.add_front_suspension(:tire_width => 2, :front_suspension_price => 60, :front_fork_travel => 3)
    assert_equal 9.0, @bike.off_road_ability
    assert_equal 210.0, @bike.price
  end

  def test_ful_suspension_bike
    @bike.add_front_suspension(:tire_width => 2, :front_suspension_price => 60, :front_fork_travel => 3)
    @bike.add_rear_suspension(:rear_suspension_price => 70, :rear_fork_travel => 4)
    assert_equal 21.0, @bike.off_road_ability
    assert_equal 280.0, @bike.price
  end
end