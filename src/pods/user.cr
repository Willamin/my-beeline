require "beeline"

class UserPod
  def initialize(fore : Color, back : Color)
    Beeline.config do
      fore fore
      back back
      pad_around do
        print ENV["USER"].strip
      end
    end
  end
end
