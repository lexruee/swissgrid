# Swissgrid

The swissgrid rubygem is a conversion library to convert WGS84 (GPS) points into the Swiss coordinate system (CH1903)
and vice versa.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'swissgrid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install swissgrid

##Usage
Require the swissgrid library as follows:
```ruby
require 'swissgrid'
```
###From WGS84(GPS) to CH1903

```ruby
 gps_point = [46.881908, 7.471829] # [lat, lon] Bern
 swiss_coord = Swissgrid::CH1903(gps_point)
```
###From CH1903 to WGS84(GPS)
```ruby
 ch1903_point = [600000, 200000] # [y, x] Bern
 wgs84_coord =  Swissgrid::WGS84(ch1903_point)
```

###Convert a list of points
```ruby
 gps_points = [ [46.881908, 7.471829], [47.220833, 7.028056] ]

# Convert to ch1903 points
 ch1903_points = gps_points.map { |p| Swissgrid::CH1903(p) }

# Convert back to gps points
 new_gps_points = ch1903_points.map { |p| Swissgrid::WGS84(p) }
```

##Changelog
 * 0.0.3
    * Update Readme.
 * 0.0.2
    * Add homepage link to gemspec.
 * 0.0.1
    * Publish first version.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/swissgrid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
