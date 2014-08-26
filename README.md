# FastHaversine
[![Build Status](https://travis-ci.org/paulnsorensen/fast_haversine.svg?branch=master)](https://travis-ci.org/paulnsorensen/fast_haversine)
[![Code Climate](https://codeclimate.com/github/paulnsorensen/fast_haversine/badges/gpa.svg)](https://codeclimate.com/github/paulnsorensen/fast_haversine)

Haversine calculation written in Ruby that supports
distances calculations in both miles and kilometers

## Installation

Add this line to your application's Gemfile:

    gem 'fast_haversine'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fast_haversine

## Usage

For kilometers:

```ruby
distance = FastHaversine.distance_between([lat1, lon1], [lat2, lon2], :km)
```

For miles:

```ruby
distance = FastHaversine.distance_between([lat1, lon1], [lat2, lon2], :mi)
```

## Benchmark

During specs, I ran the following benchmark:

```ruby
1_000_000.times { FastHaversine.distance_between(sf, chi, :mi) }

0.700000   0.000000   0.700000 (  0.700143)
```

This is much faster than a common ruby implementation:

```ruby
1_000_000.times do
  RubyHaversine.distance_between(
    [37.7833, -122.4167],
    [41.8819, -87.6278],
    units: :mi
  )
end

7.510000   0.320000   7.830000 (  7.930863)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/fast_haversine/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
