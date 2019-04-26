class MountainBike
  
  attr_reader :type_code

  def initialize(params)
    @type_code = params[:type_code]
    @commission = params[:commission]
    #...
  end

  def type_code=(mod)
    extend(mod)
  end

  def off_road_ability
    @tire_width * TIRE_WIDTH_FACTOR
  end

  def price
    (1 + @commission) * @base_price
  end
end

module FrontSuspensionMountainBike
  def price
    (1 + @commission) * @base_price + @front_suspension_price
  end

  def off_road_ability
    @tire_width * MountainBike::TIRE_WIDTH_FACTOR +  
    @front_fork_travel * MountainBike::FRONT_SUSPENSION_FACTOR
  end
end

module FullSuspensionMountainBike
  def price
    (1 + @commission) * @base_price + @front_suspension_price +
    @rear_suspension_price
  end

  def off_road_ability
    @tire_width * MountainBike::TIRE_WIDTH_FACTOR +  
    @front_fork_travel * MountainBike::FRONT_SUSPENSION_FACTOR +
    @rear_fork_travel * MountainBike::REAR_SUSPENSION_FACTOR
  end
end

bike = MountainBike.new
#...
bike.type_code = :front_suspension