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
  	
  	# make enough new planes to fill the airport
  	# maybe you shouldn't hard code this!!
  	airport.capacity.times do
  		planes_list << Plane.new
  	end

  	# GETTING PLANES TO LAND
  	# land them all:
  	while airport.planes_count < airport.capacity do
  		planes_list.each do |plane|
	  		if plane.status == 'flying'
  				plane.land_at(airport)
  			end
  			# puts plane.status
  		end
  		# puts airport.planes_count
  	end

  	# puts "Airport is now full" if airport.full? 
  	# check that all planes have status landed is already done before..
  	# so aaanyways:
  	planes_list.each do |plane|
  		expect(plane.status).to eq 'landed'
  	end

  	# GETTING PLANES TO TAKE OFF
  	# what, you landed them all? get them back in the air!
  	while airport.planes_count > 0 do
  		planes_list.each do |plane|
	  		if plane.status == 'landed'
  				plane.take_off(airport)
  			end
  			# puts plane.status
  		end
  		# puts airport.planes_count
  	end

  	planes_list.each do |plane|
  		expect(plane.status).to eq 'flying'
  	end


  end
end

