require "swissgrid/version"
require 'swissgrid/ch1903'
require 'swissgrid/wgs84'

module Swissgrid


  # Converts a WGS84 point to a CH1903 point.
  #
  # @param a_point [List] the WGS84 point to be converted.
  # @return [List] the converted WGS84 point as CH1903 point.
  #
  def self.CH1903(a_point)
    CH1903.from_wgs84(a_point)
  end

  # Converts a CH1903 point to a WGS84 point.
  #
  # @param a_point [List] the CH1903 point to be converted.
  # @return [List] the converted CH1903 point as WGS84 point.
  #
  def self.WGS84(a_point)
    WGS84.from_ch1903(a_point)
  end

end
