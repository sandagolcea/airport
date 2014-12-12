require './lib/airport.rb'

class Plane

	def initialize
		self.fly!
	end

	def flying?
		@flying
	end

	def fly!
		@flying = true
	end

	def take_off(airport)
		@flying = true
		airport.release_plane(self)
	end

	def land_at(airport)
		airport.dock_plane(self)
		@flying = false
	end


end
