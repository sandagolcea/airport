require './lib/airport.rb'

class Plane

	def initialize
		self.fly!
		@status = 'flying'
	end

	def flying?
		@flying
	end

	def fly!
		@flying = true
	end

	def status!
		if self.flying?
			status = 'flying'
		else
			status = 'landed'
		end
	end

	def status
		self.status!
	end

	def take_off(airport)
		@flying = true if airport.release_plane(self)
	end

	def land_at(airport)
		airport.dock_plane(self)
		@flying = false
	end
end
