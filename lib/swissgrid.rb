require "swissgrid/version"
require 'swissgrid/ch1903'
require 'swissgrid/wgs84'

module Swissgrid

  def self.CH1903(a_point)
    Ch1903.from_wgs84(a_point)
  end

  def self.WGS84(a_point)
    WGS84.from_ch1903(a_point)
  end

end
