class MountainBike
  TIRE_WIDTH_FACTOR = 1.5   #<= テストのために自分で設定
  FRONT_SUSPENSION_FACTOR = 2   #<= テストのために自分で設定
  REAR_SUSPENSION_FACTOR = 3   #<= テストのために自分で設定

  attr_reader :type_code  

  def initialize(params)
    set_state_from_hash(params)
  end

  def type_code=(value)  
    @type_code = value
    @bike_type = case type_code
    when :rigid
      RigidMountainBike.new(:tire_width => @tire_width)   #<=
    when :front_suspension
      FrontSuspensionMountainBike.new
    when :full_suspension
      FullSuspensionMountainBike.new
    end
  end

  def add_front_suspension(params)
    self.type_code = :front_suspension  
    set_state_from_hash(params)
  end

  def add_rear_suspension(params)
    unless @type_code == :front_suspension
      raise "You can't add rear suspension unless you have front suspension"
    end
    self.type_code = :full_suspension   
    set_state_from_hash(params)
  end

  def off_road_ability
    return @bike_type.off_road_ability if type_code == :rigid   #<=
    result = @tire_width * TIRE_WIDTH_FACTOR
    if type_code == :front_suspension || type_code == :full_suspension    
      result += @front_fork_travel * FRONT_SUSPENSION_FACTOR
    end
    if type_code == :full_suspension    
      result += @rear_fork_travel * REAR_SUSPENSION_FACTOR
    end
    result
  end

  def price
    case type_code  
    when :rigid
      (1 + @commission) * @base_price
    when :front_suspension
      (1 + @commission) * @base_price + @front_suspension_price
    when :full_suspension
      (1 + @commission) * @base_price + @front_suspension_price +
      @rear_suspension_price
    end
  end

  private

  def set_state_from_hash(hash)
    @base_price = hash[:base_price] if hash.has_key?(:base_price)
    if hash.has_key?(:front_suspension_price)
      @front_suspension_price = hash[:front_suspension_price]
    end
    if hash.has_key?(:rear_suspension_price)
      @rear_suspension_price = hash[:rear_suspension_price]
    end
    if hash.has_key?(:commission)
      @commission = hash[:commission]
    end
    if hash.has_key?(:tire_width)
      @tire_width = hash[:tire_width]
    end
    if hash.has_key?(:front_fork_travel)
      @front_fork_travel = hash[:front_fork_travel]
    end
    if hash.has_key?(:rear_fork_travel)
      @rear_fork_travel = hash[:rear_fork_travel]
    end
    self.type_code = hash[:type_code] if hash.has_key?(:type_code)  
  end
end

class RigidMountainBike

  def initialize(params)
    @tire_width = params[:tire_width]
  end

  def off_road_ability
    @tire_width * MountainBike::TIRE_WIDTH_FACTOR
  end

end

class FrontSuspensionMountainBike

end

class FullSuspensionMountainBike

end

require 'minitest/autorun'

class MountainBikeTest < Minitest::Test
  def setup
    @bike = MountainBike.new(:type_code => :rigid, :tire_width => 2.5, 
      :commission => 0.5, :base_price => 100)  
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