require 'weather_module'

class Airport
  include Weather	

  DEFAULT_CAPACITY = 6

  def initialize(options = {})
    self.capacity = options.fetch(:capacity,DEFAULT_CAPACITY)
  	@planes = []
  end

  def dock(plane)
  	if full? || self.stormy?
      false
      # raise 'It is stormy!
      # raise 'Airport is full!'
  	else
  		@planes << plane
  		# puts "Nr of planes is: #{self.planes_count}"
  	end
  end

  def release(plane)
    if empty? || self.stormy?
      false # did not release plane
      # raise 'It is stormy!'
      # >>> would it be better to raise errors?
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
    
  def capacity=(value)
    @capacity = value
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