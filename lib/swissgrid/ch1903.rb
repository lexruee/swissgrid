module Swissgrid

  module Ch1903

    PHI_BERN = 169028.66
    LAMBDA_BERN = 26782.5
    SCALE = 10000

    def self.from_wgs84(a_point)
      lat, lon, z = a_point
      phi_sec = to_sexagesimal(lat)
      lambda_sec = to_sexagesimal(lon)
      lambda_prime = (lambda_sec - LAMBDA_BERN) / SCALE.to_f
      phi_prime = (phi_sec - PHI_BERN) / SCALE.to_f
      convert(lambda_prime, phi_prime, z)
    end

    private

    def self.convert(lambda_prime, phi_prime, h)
      y = [
          600072.37,
          211455.93 * lambda_prime,
          -10938.51 * lambda_prime * phi_prime,
          -0.36 * lambda_prime * (phi_prime ** 2),
          -44.54 * (lambda_prime ** 3)
      ].reduce(:+)

      x = [
          200147.07,
          308807.95 * phi_prime,
          3745.25 * (lambda_prime ** 2),
          76.63 * (phi_prime ** 2),
          -194.56 * (lambda_prime ** 2) * phi_prime,
          119.79 * (phi_prime ** 3)
      ].reduce(:+)

      z = if h.nil?
            h
          else
            [
                h - 49.55,
                2.73 * lambda_prime,
                6.94 * phi_prime
            ].reduce(:+)
          end

      z.nil? ? [y, x] : [y, x, z]
    end


    def self.to_gps_triple(dec_degress)
      degrees = dec_degress.to_i
      minutes = (60*(dec_degress - degrees)).to_i
      seconds = (60*(dec_degress - degrees) - minutes) * 60
      [degrees, minutes, seconds]
    end

    def self.to_sexagesimal(dec_degress)
      degree, minutes, seconds = to_gps_triple(dec_degress)
      degree * 3600 + minutes * 60 + seconds
    end

  end

end