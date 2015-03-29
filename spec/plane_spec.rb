require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { double :airport }

  it 'has a flying status when created' do
    expect(plane).to be_flying
  end

  it 'has a flying status when in the air' do
    allow(airport).to receive(:dock).with(plane).and_return(true)

    expect(plane).to be_flying
    expect(plane.status).to eq 'flying'
    plane.land_at(airport)
    expect(plane.status).to eq 'landed'
  end

  it 'can take off' do
    allow(airport).to receive(:dock).with(plane)
    allow(airport).to receive(:release).with(plane).and_return(true)

    plane.land_at(airport)
    plane.take_off_from(airport)
    expect(plane).to be_flying
  end

  it 'changes its status to flying after taking of' do
    allow(airport).to receive(:dock).with(plane)
    allow(airport).to receive(:release).with(plane).and_return(true)

    plane.land_at(airport)
    plane.take_off_from(airport)
    expect(plane).to be_flying
  end
end
