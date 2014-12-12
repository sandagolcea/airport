require 'airport'
require 'plane'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) {Plane.new}

  context 'taking off and landing' do

    it 'a plane can land' do
      plane.land_at(airport)
      expect(plane).not_to be_flying
    end

    it 'a plane can take off' do
      plane.land_at(airport)
      plane.take_off(airport)
      # expect(airport).to be_empty
      expect(plane).to be_flying
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      (airport.capacity).times {(Plane.new).land_at(airport)}
      expect(lambda{(Plane.new).land_at(airport)}).to raise_error(RuntimeError, 'Airport is full!')
    end

    context 'weather conditions' do

      xit 'a plane cannot take off when there is a storm brewing' do

      end

      xit 'a plane cannot land in the middle of a storm' do

      end
    end
  end
end

# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

describe "The grand finale (last spec)" do

  xit 'all planes can land and all planes can take off' do

  end
end

