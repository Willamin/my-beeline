require "beeline"

class EmptyPod
  def initialize(fore : Color, back : Color)
    Beeline.config do
      fore fore
      back back
      padding
    end
  end
end
