require 'plane'

describe Plane do

  let(:plane) { Plane.new }
  let(:airport) {Airport.new}

  it 'has a flying status when created' do
    expect(plane).to be_flying
  end

  it 'has a flying status when in the air' do
    expect(plane).to be_flying
    expect(plane.status).to eq 'flying'
    
    plane.land_at(airport)
    expect(plane.status).to eq 'landed'
  end

  it 'can take off' do
    plane.land_at(airport)
    plane.take_off(airport)
    expect(plane).to be_flying
    expect(airport).to be_empty
  end

  it 'changes its status to flying after taking of' do
    plane.land_at(airport)
    plane.take_off(airport)
    expect(plane).to be_flying
  end
end
