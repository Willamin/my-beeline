require "beeline"

class UserPod
  def initialize(fore : Color, back : Color)
    Beeline.config do
      fore fore
      back back
      pad_around do
        print `whoami`.strip
      end
    end
  end
end
