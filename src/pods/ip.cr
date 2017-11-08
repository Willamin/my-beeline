require "beeline"

alias Color = BLine::Colors::Color

class IpPod
  def initialize(fore : Color, back : Color)
    Beeline.config do
      fore fore
      back back
      pad_around do
        ip = `ifconfig en0 | grep "inet " | cut -d " " -f2`.strip
        octets = ip.split(".")

        case octets[0..2].join(".")
        when "192.168.1"
          print "192"
          pad_around { triangle_right_empty }
          print octets[-1]
        when "10.0.0"
          print "10"
          pad_around { triangle_right_empty }
          print octets[-1]
        else
          print ip
        end
      end
    end
  end
end
