module Swissgrid

  module CH1903

    # Projection centre Bern
    PHI_BERN = 169_028.66 # in meters
    LAMBDA_BERN = 26_782.5 # in meters
    SCALE = 10_000 # scale to unit 10000"


    # Converts a CH1903 point to a WGS84 point.
    #
    # @param a_point [List] the CH1903 point to be converted.
    # @return [List] the converted CH1903 point as WGS84 point.
    #
    def self.from_wgs84(a_point)
      lat, lon, z = a_point
      phi_sec = to_arc_seconds(lat)
      lambda_sec = to_arc_seconds(lon)
      lambda_prime = (lambda_sec - LAMBDA_BERN) / SCALE.to_f
      phi_prime = (phi_sec - PHI_BERN) / SCALE.to_f

      # compute WGS84 point
      convert(lambda_prime, phi_prime, z)
    end


    private


    # Computes the WGS84 point by means of the auxiliary parameters lambda', phi' and height h.
    #
    # @param lambda_prime [Float] auxiliary parameter lambda'.
    # @param phi_prime [Float] auxiliary parameter phi'.
    # @param h [Float] height h.
    #
    def self.convert(lambda_prime, phi_prime, h)
      y = [
          600_072.37,
          211_455.93 * lambda_prime,
          -10_938.51 * lambda_prime * phi_prime,
          -0.36 * lambda_prime * (phi_prime ** 2),
          -44.54 * (lambda_prime ** 3)
      ].reduce(:+)

      x = [
          200_147.07,
          308_807.95 * phi_prime,
          3_745.25 * (lambda_prime ** 2),
          76.63 * (phi_prime ** 2),
          -194.56 * (lambda_prime ** 2) * phi_prime,
          119.79 * (phi_prime ** 3)
      ].reduce(:+)

      z = if h.nil? # if nil do nothing
            h
          else
            [
                h - 49.55,
                2.73 * lambda_prime,
                6.94 * phi_prime
            ].reduce(:+)
          end

      z.nil? ? [y, x] : [y, x, z] # if z is nil, remove z component
    end


    # Converts decimal degrees to a DMS triple that consists of the parts degree, minutes and seconds.
    #
    # @param dec_degrees [Float] decimal degrees to be converted.
    # @return [List] a triple [degree, minutes, seconds].
    #
    def self.to_dms_triple(dec_degrees)
      degrees = dec_degrees.to_i
      minutes = (60*(dec_degrees - degrees)).to_i
      seconds = (60*(dec_degrees - degrees) - minutes) * 60
      [degrees, minutes, seconds]
    end


    # Converts decimal degrees to arc seconds.
    #
    # @param dec_degrees [Float] decimal degrees to be converted.
    # @return [Float] arc seconds.
    #
    def self.to_arc_seconds(dec_degrees)
      degree, minutes, seconds = to_dms_triple(dec_degrees)
      degree * 3600 + minutes * 60 + seconds
    end

  end

  Ch1903 = CH1903 # to be compatible to previous versions

end