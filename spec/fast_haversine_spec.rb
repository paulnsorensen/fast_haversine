require 'spec_helper'
require 'lib/fast_haversine'

describe FastHaversine do
  describe '.distance_between' do
    let(:sf) { [37.7833, -122.4167] }
    let(:chi) { [41.8819, -87.6278] }

    it 'calculates distance in miles' do
      distance = FastHaversine.distance_between(sf, chi, :mi)

      expect(distance.round(12)).to eql(1854.489697974166)
    end

    it 'calculates distance in kilometers' do
      distance = FastHaversine.distance_between(sf, chi, :km)

      expect(distance.round(12)).to eql(2984.511869636476)
    end
  end
end
