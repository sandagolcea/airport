require 'airport'
require 'plane'
# grand final
# Given 6 planes, each plane must land.
# When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have status flying!

describe 'The grand finale (last spec)' do
  let(:airport) { Airport.new(capacity: 6) }

  it 'all planes can land and all planes can take off' do
    # land 6 planes, wait until all of them have landed
    planes_list = []

    airport.capacity.times { planes_list << Plane.new }

    # GETTING PLANES TO LAND
    while airport.planes_count < airport.capacity
      planes_list.each { |plane| plane.land_at(airport) if plane.status == 'flying' }
    end
    expect(planes_list.map(&:status).uniq).to eq ['landed']
    while airport.planes_count > 0
      planes_list.each { |plane| plane.take_off_from(airport) if plane.status == 'landed' }
    end
    expect(planes_list.map(&:status).uniq).to eq ['flying']
  end
end
