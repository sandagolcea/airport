class Airport
	
  DEFAULT_CAPACITY = 6

  def initialize
  	@planes = []
  end

  def dock_plane(plane)
  	if full? 
  		raise 'Airport is full!'
  	else
  		@planes << plane
  		# puts "Nr of planes is: #{@planes.count}"
  	end
  end

  def release_plane(plane)
  	unless empty?
  		if (plane).is_a?(Array)
  			plane.each {|p| @planes.delete(p)}
  		else
  			@planes.delete(plane)
  		end
  	end
  end

  def capacity
		@capacity ||= DEFAULT_CAPACITY
  end

  def full?
  	# raise "Plane is full" if @planes.count >= CAPACITY
  	true if @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
  	# raise "Airport empty!" if @planes.count <= 0
  	true if @planes.count <= 0
  end
end