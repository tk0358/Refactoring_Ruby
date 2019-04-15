def distance_traveled(time)
  primary_acc = @primary_force / @mass
  primary_time = [time, @delay].min
  result = distance(0, primary_time, primary_acc)
  secondary_time = time - @delay
  if(secondary_time > 0)
    primary_vel = primary_acc * @delay
    secondary_acc = (@primary_force + @secodary_force) / @mass
    result += distance(primary_vel, secondary_time, secondary_acc)
  end
  result
end

def distance(vel, time, acc)
  vel * t + 0.5 * acc * time * time
end