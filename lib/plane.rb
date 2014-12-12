require './lib/airport.rb'

class Plane

	def initialize
		self.fly!
	end

	def land_at(airport)
		@flying = false
		airport.dock_plane(self)
	end

	def flying?
		@flying
	end

	def fly!
		@flying = true
	end

end
