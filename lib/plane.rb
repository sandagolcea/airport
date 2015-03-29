require './lib/airport.rb'

class Plane
  attr_reader :flying
  alias_method :flying?, :flying

  def initialize
    self.fly!
  end

  def fly!
    @flying = true
  end

  def status!
    self.flying? ? 'flying' : 'landed'
  end

  def status
    self.status!
  end

  def take_off_from(airport)
    @flying = true if airport.release(self)
  end

  def land_at(airport)
    @flying = false if airport.dock(self)
  end
end
