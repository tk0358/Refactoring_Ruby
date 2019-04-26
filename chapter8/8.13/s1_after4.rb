class MountainBike
  
  attr_reader :type_code

  def initialize(params)
    @type_code = params[:type_code]
    @commission = params[:commission]
    #...
  end

  def type_code=(value)
    @type_code = value
    case type_code
    when :front_suspension
      extend(FrontSuspensionMountainBike)
    when :full_suspension
      extend(FullSuspensionMountainBike)
    end
  end

  def off_road_ability
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
    (1 + @commission) * @base_price
  end
end

module FrontSuspensionMountainBike
  def price
    (1 + @commission) * @base_price + @front_suspension_price
  end
end

module FullSuspensionMountainBike
  def price
    (1 + @commission) * @base_price + @front_suspension_price +
    @rear_suspension_price
  end
end

bike = MountainBike.new(:type_code => :rigid)
#...
bike.type_code = :front_suspension