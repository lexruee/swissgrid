module Swissgrid

  module WGS84

    Y_BERN = 600_000
    X_BERN = 200_000
    SCALE = 1_000_000

    def self.from_ch1903(a_point)
      y, x , z = a_point
      y_prime = (y - Y_BERN) / SCALE.to_f
      x_prime = (x - X_BERN) / SCALE.to_f
      convert(y_prime, x_prime, z)
    end

    private

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

      z = if h_prime.nil?
            h_prime
          else
            [
                h_prime + 49.55,
                -12.60 * y_prime,
                -22.64 * x_prime
            ].reduce(:+)
          end

      lat, lon = [phi_prime, lambda_prime].map { |v| v * 100/36.to_f }
      z.nil? ? [lat, lon] : [lat, lon, z]
    end

  end

end