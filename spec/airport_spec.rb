require 'airport'
require 'plane'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) {Plane.new}
  let(:flying_plane){double :flying_plane, flying?: true}

  context '*taking off and landing*' do

    it 'a plane can land' do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.dock_plane(flying_plane)
      expect(airport.planes_count).to eq 1
    end

    it 'a plane can take off' do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.dock_plane(flying_plane)
      # plane landed, still calling it flying_plane. because yes.
      airport.release_plane(flying_plane)
      expect(airport.planes_count).to eq 0
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      allow(airport).to receive(:stormy?).and_return(false)
      # (airport.capacity).times {(Plane.new).land_at(airport)}
      # >>> Question: doesn't this dock the same plane all over again? && should I check for this?
      (airport.capacity).times {airport.dock_plane(flying_plane)}
      expect(lambda{(Plane.new).land_at(airport)}).to raise_error(RuntimeError, 'Airport is full!')
    end

    context 'weather conditions' do

      it 'a plane cannot take off when there is a storm brewing' do
        allow(airport).to receive(:stormy?).and_return(false)
        airport.dock_plane(plane)
        allow(airport).to receive(:stormy?).and_return(true)
        expect(lambda {airport.release_plane(plane)}).to raise_error(RuntimeError, 'It is stormy!')
      end

      it 'a plane cannot land in the middle of a storm' do
        allow(airport).to receive(:stormy?).and_return(true)
        expect(lambda {airport.dock_plane(plane)}).to raise_error(RuntimeError, 'It is stormy!')
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

