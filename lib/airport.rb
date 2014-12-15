require 'weather_module'

class Airport
  include Weather	

  DEFAULT_CAPACITY = 6

  def initialize
  	@planes = []
  end

  def dock_plane(plane)
  	if full? 
  		# raise 'Airport is full!'
      false
    elsif self.stormy?
      raise 'It is stormy!'
      # false
  	else
  		@planes << plane
  		# puts "Nr of planes is: #{self.planes_count}"
  	end
  end

  def release_plane(plane)
    if empty?
      false # did not release plane, better to raise errors?
    elsif self.stormy?
      # false # stormy weather, don't let the plane go!
      raise 'It is stormy!'
    else
  		if (plane).is_a?(Array)
  			plane.each {|p| @planes.delete(p)}
  		else
  			@planes.delete(plane)
  		end
      return true # plane has been released
  	end

  end

  def capacity
		@capacity ||= DEFAULT_CAPACITY
  end

  def full?
  	true if @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
  	true if planes_count <= 0
  end

  def planes_count
    @planes.count
  end
end