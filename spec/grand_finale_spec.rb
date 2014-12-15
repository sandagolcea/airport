require 'airport'
require 'plane'
# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

describe "The grand finale (last spec)" do
  let(:airport){Airport.new}

  it 'all planes can land and all planes can take off' do
  	# land 6 planes, wait until all of them have landed
  	
  	landed = 0
  	planes_list = []
  	
  	# make 6 new planes, in this case capacity is 6..
  	# maybe you shouldn't hard code this!!
  	6.times do
  		planes_list << Plane.new
  	end

  	# land them all:
  	while airport.planes_count < 6 do
  		planes_list.each do |plane|
	  		if plane.status == 'flying'
  				plane.land_at(airport)
  			end
  			# puts plane.status
  		end
  		# puts airport.planes_count
  	end

  end
end

