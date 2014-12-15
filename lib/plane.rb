require './lib/airport.rb'

class Plane

	def initialize
		self.fly!
		# @status = 'flying'
	end

	def flying?
		@flying
	end

	def fly!
		@flying = true
	end

	def status!
		# if self.flying?
		# 	status = 'flying'
		# else
		# 	status = 'landed'
		# end
    status = (self.flying? ? 'flying' : 'landed')
	end

	def status
		self.status!
	end

	def take_off_from(airport)
		@flying = true if airport.release(self)
	end

	def land_at(airport)
		# airport.dock_plane(self)
		# @flying = false
		@flying = false if airport.dock(self)
	end
end
