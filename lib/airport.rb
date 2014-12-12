class Airport
	
  CAPACITY = 5

  def initialize
  	@planes = []
  end

  def dock_plane(plane)
  	unless full? 
  		@planes << plane
  		puts "Nr of planes is: #{@planes.count}"
  	end
  end


  def full?
  	raise "Plane is full" if @planes.count >= CAPACITY
  end
end