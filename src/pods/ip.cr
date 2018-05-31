require "beeline"
require "interface_address"

alias Color = BLine::Colors::Color

class IpPod
  def initialize(fore : Color, back : Color)
    Beeline.config do
      fore fore
      back back
      pad_around do
        ip_list = InterfaceAddress
          .get_interface_addresses
          .select { |a| a.interface_name == "en0" }
          .select { |a| a.ip_address.address.includes?(".") }

        case ip_list.size
        when 0
          print "---"
        when 1
          ip = ip_list[0].ip_address.address
          print ip
        else
          print "?"
        end
      end
    end
  end

  def shorten(ip)
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
