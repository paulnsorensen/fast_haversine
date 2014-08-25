require 'fast_haversine/version'
require 'fast_haversine/fast_haversine'

module FastHaversine
  def self.distance_between(point_a, point_b, units)
    case units
    when :km
      return distance_in_km(point_a[0], point_a[1], point_b[0], point_b[1])
    when :mi
      return distance_in_mi(point_a[0], point_a[1], point_b[0], point_b[1])
    end
  end
end
