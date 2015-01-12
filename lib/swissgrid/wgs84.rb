module Swissgrid

  module WGS84

    # Projection centre Bern
    Y_BERN = 600_000 # in meters
    X_BERN = 200_000 # in meters
    SCALE = 1_000_000 # scale to unit 1000km


    # Converts a WGS84 point to a CH1903 point.
    #
    # @param a_point [List] the WGS84 point to be converted.
    # @return [List] the converted WGS84 point as CH1903 point.
    #
    def self.from_ch1903(a_point)
      y, x , z = a_point
      y_prime = (y - Y_BERN) / SCALE.to_f
      x_prime = (x - X_BERN) / SCALE.to_f

      # compute CH1903 point
      convert(y_prime, x_prime, z)
    end


    private


    # Computes the CH1903 point by means of the auxiliary parameters y', x' and height h'.
    #
    # @param y_prime [Float] auxiliary parameter y'.
    # @param x_prime [Float] auxiliary parameter x'.
    # @param h_prime [Float] height h.
    #
    def self.convert(y_prime, x_prime, h_prime)
      lambda_prime = [
          2.6779094,
          4.728982 * y_prime,
          0.791484 * y_prime * x_prime,
          0.1306 * y_prime * (x_prime ** 2),
          -0.0436 * (y_prime ** 3)
      ].reduce(:+)

      phi_prime = [
          16.9023892 ,
          3.238272 * x_prime,
          -0.270978 * (y_prime ** 2),
          -0.002528 * (x_prime ** 2),
          -0.0447 * (y_prime ** 2) * x_prime,
          -0.0140  * (x_prime ** 3)
      ].reduce(:+)

      z = if h_prime.nil? # if nil do nothing
            h_prime
          else
            [
                h_prime + 49.55,
                -12.60 * y_prime,
                -22.64 * x_prime
            ].reduce(:+)
          end

      lat, lon = [phi_prime, lambda_prime].map { |v| v * 100/36.to_f }
      z.nil? ? [lat, lon] : [lat, lon, z] # if z is nil, remove z component
    end

  end

end