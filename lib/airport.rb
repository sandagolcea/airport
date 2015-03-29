# Airport with planes
require_relative 'weather_module'

class Airport
  include Weather

  DEFAULT_CAPACITY = 6
  attr_writer :capacity

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @planes = []
  end

  def dock(plane)
    return false if full? || self.stormy?
    @planes << plane
  end

  def release(plane)
    return false if empty? || self.stormy?
    plane.each { |p| @planes.delete(p) } if (plane).is_a?(Array)
    @planes.delete(plane) unless (plane).is_a?(Array)
    true
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    planes_count <= 0
  end

  def planes_count
    @planes.count
  end
end
