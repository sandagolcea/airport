require 'airport'
require 'plane'

describe Airport do

  let(:airport) { Airport.new(:capacity => 6)}
  let(:plane) {Plane.new}

  let(:my_plane){double :my_plane}
  let(:flying_plane){double :flying_plane, flying?: true}
  

  context 'taking off and landing' do

    it 'a plane can land' do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.dock(flying_plane)
      expect(airport.planes_count).to eq 1
    end

    it 'a plane can take off' do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.dock(my_plane)
      
      airport.release(my_plane)
      expect(airport.planes_count).to eq 0
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      allow(airport).to receive(:stormy?).and_return(false)
      # (airport.capacity).times {(Plane.new).land_at(airport)}
      # >>> Question: doesn't this dock the same plane all over again? && should I check for this?
      (airport.capacity).times {airport.dock(flying_plane)}
      expect(airport.dock(flying_plane)).to eq false
      # initial test, this works:
      # expect(lambda{(Plane.new).land_at(airport)}).to raise_error(RuntimeError, 'Airport is full!')
    end

    context 'weather conditions' do

      it 'a plane cannot take off when there is a storm brewing' do
        allow(airport).to receive(:stormy?).and_return(false)
        airport.dock(plane)
        allow(airport).to receive(:stormy?).and_return(true)
        # expect(lambda {airport.release(plane)}).to raise_error(RuntimeError, 'It is stormy!')
        airport.release(plane)
        expect(airport.planes_count).to eq 1
      end

      it 'a plane cannot land in the middle of a storm' do
        allow(airport).to receive(:stormy?).and_return(true)
        # expect(lambda {airport.dock(plane)}).to raise_error(RuntimeError, 'It is stormy!')
        airport.dock(plane)
        expect(airport.planes_count).to eq 0
      end
    end
  end
end
