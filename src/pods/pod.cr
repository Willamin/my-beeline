abstract class Pod
  def initialize(fore : Color = Clear, back : Color = Clear)
    Beeline.config do
      fore fore
      back back
      yielded
    end
  end

  macro yielded
    padding
  end
end
