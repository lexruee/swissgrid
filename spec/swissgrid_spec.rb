require 'spec_helper'

module Swissgrid

  PRECISION_CH1903_TO_WGS84 = 0.1/3600 # Precision in the order of 0.1"
  PRECISION_WGS84_TO_CH1903 = 1.5 # Precision in the order of 1.5 metre

  describe Swissgrid do

    #
    # Test conversion methods directly.
    #

    describe CH1903 do
      it "tests from_wgs84" do
        wgs84_point = [46.881908, 7.471829]
        expected_ch1903_point = [602_530.221, 192_310.331]
        ch1903_coord = Swissgrid::CH1903.from_wgs84(wgs84_point)
        expect(ch1903_coord[0]).to be_within(PRECISION_WGS84_TO_CH1903).of(expected_ch1903_point[0])
        expect(ch1903_coord[1]).to be_within(PRECISION_WGS84_TO_CH1903).of(expected_ch1903_point[1])
      end
    end

    describe WGS84 do
      it "tests from_ch903" do
        ch1903_point = [602_530.221, 192_310.331]
        expected_wgs84_point = [46.881908, 7.471829]
        wgs84_coord = Swissgrid::WGS84.from_ch1903(ch1903_point)
        expect(wgs84_coord[0]).to be_within(PRECISION_CH1903_TO_WGS84).of(expected_wgs84_point[0])
        expect(wgs84_coord[1]).to be_within(PRECISION_CH1903_TO_WGS84).of(expected_wgs84_point[1])
      end
    end

    #
    # Test conversion: Zimmerwald CH1903 [602_530.221, 192_310.331] <=> WGS84 [46.881908, 7.471829]
    #

    it "tests conversion from Zimmerwald wgs84 point to ch1903 point" do
      wgs84_point = [46.881908, 7.471829]
      expected_ch1903_point = [602_530.221, 192_310.331]
      ch1903_coord = Swissgrid::CH1903(wgs84_point)
      expect(ch1903_coord[0]).to be_within(PRECISION_WGS84_TO_CH1903).of(expected_ch1903_point[0])
      expect(ch1903_coord[1]).to be_within(PRECISION_WGS84_TO_CH1903).of(expected_ch1903_point[1])
    end


    it "tests conversion from Zimmerwald ch1903 point to wgs84 point" do
      ch1903_point = [602_530.221, 192_310.331]
      expected_wgs84_point = [46.881908, 7.471829]
      wgs84_coord = Swissgrid::WGS84(ch1903_point)
      expect(wgs84_coord[0]).to be_within(PRECISION_CH1903_TO_WGS84).of(expected_wgs84_point[0])
      expect(wgs84_coord[1]).to be_within(PRECISION_CH1903_TO_WGS84).of(expected_wgs84_point[1])
    end


    #
    # Test conversion: Zuerich CH1903 [683_082.039, 247_793.250] <=> WGS84 [47.375736, 8.538750]
    #

    it "tests conversion from Zuerich wgs84 point to ch1903 point" do
      wgs84_point = [47.375736, 8.538750]
      expected_ch1903_point = [683_082.039, 247_793.250]
      ch1903_coord = Swissgrid::CH1903(wgs84_point)
      expect(ch1903_coord[0]).to be_within(PRECISION_WGS84_TO_CH1903).of(expected_ch1903_point[0])
      expect(ch1903_coord[1]).to be_within(PRECISION_WGS84_TO_CH1903).of(expected_ch1903_point[1])
    end


    it "tests conversion from Zuerich ch1903 point to wgs84 point" do
      ch1903_point = [683_082.039, 247_793.250]
      expected_wgs84_point = [47.375736, 8.538750]
      wgs84_coord = Swissgrid::WGS84(ch1903_point)
      expect(wgs84_coord[0]).to be_within(PRECISION_CH1903_TO_WGS84).of(expected_wgs84_point[0])
      expect(wgs84_coord[1]).to be_within(PRECISION_CH1903_TO_WGS84).of(expected_wgs84_point[1])
    end


    #
    # Test conversion: Bern CH1903 [600_000, 200_000] <=> WGS84 [46.951082877, 7.438632495]
    #

    it "tests conversion from Bern wgs84 point to ch1903 point" do
      wgs84_point = [46.951082877, 7.438632495]
      expected_ch1903_point = [600_000, 200_000]
      ch1903_coord = Swissgrid::CH1903(wgs84_point)
      expect(ch1903_coord[0]).to be_within(PRECISION_WGS84_TO_CH1903).of(expected_ch1903_point[0])
      expect(ch1903_coord[1]).to be_within(PRECISION_WGS84_TO_CH1903).of(expected_ch1903_point[1])
    end


    it "tests conversion from Bern ch1903 point to wgs84 point" do
      ch1903_point = [600_000, 200_000]
      expected_wgs84_point = [46.951082877, 7.438632495]
      wgs84_coord = Swissgrid::WGS84(ch1903_point)
      expect(wgs84_coord[0]).to be_within(PRECISION_CH1903_TO_WGS84).of(expected_wgs84_point[0])
      expect(wgs84_coord[1]).to be_within(PRECISION_CH1903_TO_WGS84).of(expected_wgs84_point[1])
    end


    #
    # Test conversion: Lugano CH1903 [717_665.373, 95_957.362] <=> WGS84 [46.951082877, 7.438632495]
    #

    it "tests conversion from Lugano wgs84 point to ch1903 point" do
      wgs84_point = [46.004914, 8.957646]
      expected_ch1903_point = [717_665.373, 95_957.362]
      ch1903_coord = Swissgrid::CH1903(wgs84_point)
      expect(ch1903_coord[0]).to be_within(PRECISION_WGS84_TO_CH1903).of(expected_ch1903_point[0])
      expect(ch1903_coord[1]).to be_within(PRECISION_WGS84_TO_CH1903).of(expected_ch1903_point[1])
    end


    it "tests conversion from Lugano ch1903 point to wgs84 point" do
      ch1903_point = [717_665.373, 95_957.362]
      expected_wgs84_point = [46.004914, 8.957646]
      wgs84_coord = Swissgrid::WGS84(ch1903_point)
      expect(wgs84_coord[0]).to be_within(PRECISION_CH1903_TO_WGS84).of(expected_wgs84_point[0])
      expect(wgs84_coord[1]).to be_within(PRECISION_CH1903_TO_WGS84).of(expected_wgs84_point[1])
    end


    #
    # Test conversion: Geneva CH1903 [501_000.723, 118_136.350] <=> WGS84 [46.207383, 6.155882]
    #

    it "tests conversion from Geneva wgs84 point to ch1903 point" do
      wgs84_point = [46.207383, 6.155882]
      expected_ch1903_point = [501_000.723, 118_136.350]
      ch1903_coord = Swissgrid::CH1903(wgs84_point)
      expect(ch1903_coord[0]).to be_within(PRECISION_WGS84_TO_CH1903).of(expected_ch1903_point[0])
      expect(ch1903_coord[1]).to be_within(PRECISION_WGS84_TO_CH1903).of(expected_ch1903_point[1])
    end


    it "tests conversion from Geneva ch1903 point to wgs84 point" do
      ch1903_point = [501_000.723, 118_136.350]
      expected_wgs_point = [46.207383, 6.155882]
      wgs84_coord = Swissgrid::WGS84(ch1903_point)
      expect(wgs84_coord[0]).to be_within(PRECISION_CH1903_TO_WGS84).of(expected_wgs_point[0])
      expect(wgs84_coord[1]).to be_within(PRECISION_CH1903_TO_WGS84).of(expected_wgs_point[1])
    end


    #
    # Test conversion: Thun CH1903 [611_202, 177_630] <=> WGS84 [46.7497613025, 7.58523830611]
    #

    it "tests conversion from Thun wgs84 point to ch1903 point" do
      wgs84_point = [46.7497613025, 7.58523830611]
      expected_ch1903_point = [611_202, 177_630]
      ch1903_coord = Swissgrid::CH1903(wgs84_point)
      expect(ch1903_coord[0]).to be_within(PRECISION_WGS84_TO_CH1903).of(expected_ch1903_point[0])
      expect(ch1903_coord[1]).to be_within(PRECISION_WGS84_TO_CH1903).of(expected_ch1903_point[1])
    end


    it "tests conversion from Thun ch1903 point to wgs84 point" do
      ch1903_point = [611_202, 177_630]
      expected_wgs_point = [46.7497613025, 7.58523830611]
      wgs84_coord = Swissgrid::WGS84(ch1903_point)
      expect(wgs84_coord[0]).to be_within(PRECISION_CH1903_TO_WGS84).of(expected_wgs_point[0])
      expect(wgs84_coord[1]).to be_within(PRECISION_CH1903_TO_WGS84).of(expected_wgs_point[1])
    end

  end

end