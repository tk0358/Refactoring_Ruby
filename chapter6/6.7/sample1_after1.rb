def distance_traveled(time)
  primary_acc = @primary_force / @mass
  primary_time = [time, @delay].min
  result = 0.5 * primary_acc * primary_time * primary_time
  secondary_time = time - @delay
  if(secondary_time > 0)
    primary_vel = primary_acc * @delay
    acc = (@primary_force + @secodary_force) / @mass
    result += primary_vel * secondary_time + 0.5 * acc * secondary_time * 
      secondary_time
  end
  result
end