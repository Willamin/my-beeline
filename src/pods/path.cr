require "beeline"

class PathPod
  def initialize(fore : Color, back : Color)
    Beeline.config do
      fore fore
      back back
      pad_around do
        if ENV["PWD"] == ENV["HOME"]
          print "~"
        else
          dirs = ENV["PWD"].split("/")[1..-1]
          if dirs.size > 1
            ellipsis
          end
          print "/"
          print dirs[-1]
        end
      end
    end
  end
end
