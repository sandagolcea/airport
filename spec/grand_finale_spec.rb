require 'airport'
require 'plane'
# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

describe "The grand finale (last spec)" do
  let(:airport){Airport.new(:capacity => 6)}

  it 'all planes can land and all planes can take off' do
    # land 6 planes, wait until all of them have landed

    landed = 0
    planes_list = []

    airport.capacity.times { planes_list << Plane.new }

    # GETTING PLANES TO LAND
    # land them all:
    while airport.planes_count < airport.capacity do
      planes_list.each { |plane| plane.land_at(airport) if plane.status == 'flying' }
    end

    # while
    #   airport.planes_count < airport.capacity
    #     and
    #       for each plane in the list
    #           if plane.status -- 'flying'
    #             land plane at the airport

    # puts "Airport is now full" if airport.full?
    # check that all planes have status landed is already done before..
    # so aaanyways:
    # planes_list.each do |plane|
    #   expect(plane.status).to eq 'landed'
    # end

    expect(planes_list.map(&:status).uniq).to eq ['landed']
    #### http://stackoverflow.com/questions/1217088/what-does-mapname-mean-in-ruby

    # GETTING PLANES TO TAKE OFF
    # what, you landed them all? get them back in the air!
    # while airport.planes_count > 0 do
    #   planes_list.each do |plane|
    #     if plane.status == 'landed'
    #       plane.take_off_from(airport)
    #     end
    #     # puts plane.status
    #   end
    #   # puts airport.planes_count
    # end
    #
    # planes_list.each do |plane|
    # 	expect(plane.status).to eq 'flying'
    # end
    while airport.planes_count > 0 do
      planes_list.each { |plane| plane.take_off_from(airport) if plane.status == 'landed' }
    end
    
    expect(planes_list.map(&:status).uniq).to eq ['flying']


  end
end
