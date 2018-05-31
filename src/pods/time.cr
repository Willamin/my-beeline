require "beeline"

class TimePod
  def initialize(fore : Color, back : Color)
    Beeline.config do
      fore fore
      back back
      pad_around do
        print `date +%r`.strip
      end
    end
  end
end
