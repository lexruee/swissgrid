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

###Swissgrid
The swissgird library has currently two modules:

 * CH1903 - responsible for CH1903 conversions
 * WGS84 - responsible for WGS84 conversions

If other conversions are needed just create an issue or make a pull request :-).

###From WGS84(GPS) to CH1903
A WGS84 point can easily be converted to a CH1903 point as follows:

```ruby
 wgs84_point = [46.951082877, 7.438632495] # [lat, lon] Bern, The building of exact sciences.
 ch1903_coord = Swissgrid::CH1903.from_wgs84(wgs84_point)
```

Or just use the following shortcut:

```ruby
 wgs84_point = [46.951082877, 7.438632495] # [lat, lon] Bern, The building of exact sciences.
 ch1903_coord = Swissgrid::CH1903(wgs84_point)
```
###From CH1903 to WGS84(GPS)
The same way a CH1903 point can be converted to a WGS84 point:

```ruby
 ch1903_point = [600_000, 200_000] # [y, x] Bern, The building of exact sciences.
 wgs84_coord =  Swissgrid::WGS84.from_ch1903(ch1903_point)
```


Or just use the following shortcut:

```ruby
 ch1903_point = [600_000, 200_000] # [y, x] Bern, The building of exact sciences.
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
 * 0.1.1
    * Refactor tests and codebase
    * Update Readme
    * Add comments
 * 0.1.0
    * Fix ch1903 to wgs84 conversion bug. Thanks @christianmeichtry.
 * 0.0.3
    * Update Readme.
 * 0.0.2
    * Add homepage link to gemspec.
 * 0.0.1
    * Publish first version.

##Specification CH1903 <=> WGS84
For more details about the conversion see [Swisstopo Referenzsysteme](http://www.swisstopo.admin.ch/internet/swisstopo/en/home/products/software/products/skripts.parsysrelated1.45237.downloadList.10374.DownloadFile.tmp/swissprojectionen.pdf).

##Other tools and scripts
Swisstopo has also created some scripts and tools for other languages like Java, [Python](https://github.com/lexruee/wgs84ch1903py)[1] and PHP.

For more details see [Swisstopo Scripts and Tools](http://www.swisstopo.admin.ch/internet/swisstopo/en/home/products/software/products/skripts.html).

* [1] The python script is not available anymore. I uploaded it [here on github](https://github.com/lexruee/wgs84ch1903py).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/swissgrid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
