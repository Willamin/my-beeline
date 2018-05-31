require "beeline"

class GitBranchPod
  def initialize(fore : Color = Clear, back : Color = Clear)
    Beeline.config do
      fore fore
      back back
      pad_around do
        branch
        padding
        if Git.should_show?
          print Git.branch.split(".")[0]
        else
          print "---"
        end
      end
    end
  end
end
