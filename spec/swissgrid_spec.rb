require 'spec_helper'

module Swissgrid

  describe Swissgrid do

    it "tests conversion from wgs84 to ch1903" do
      gps_point = [46.881908, 7.471829]
      swiss_coord = Swissgrid::CH1903(gps_point)
      expect(swiss_coord[0]).to be_within(0.5).of(602530.221)
      expect(swiss_coord[1]).to be_within(0.5).of(192310.331)
      pp swiss_coord
    end


    it "tests conversion from ch1903 to wgs84" do
      ch1903_point = [600_000, 200_000]
      wgs84_coord =  Swissgrid::WGS84(ch1903_point)
      expect(wgs84_coord[0]).to be_within(0.1/3600).of(46.951082877)
      expect(wgs84_coord[1]).to be_within(0.1/3600).of(7.438632495)
      pp wgs84_coord
    end

    it "tests conversion from Thun ch1903 point to wgs 84 point" do
      ch1903_point = [611_202, 177_630]
      expected_wgs_point = [46.7497613025, 7.58523830611]
      wgs84_coord =  Swissgrid::WGS84(ch1903_point)
      expect(wgs84_coord[0]).to be_within(0.5).of(expected_wgs_point[0])
      expect(wgs84_coord[1]).to be_within(0.5).of(expected_wgs_point[1])
      pp wgs84_coord
    end

  end

end