require "beeline"

class GitChangesPod
  def initialize(fore : Color = Clear, back : Color = Clear, padding : Bool = true)
    Beeline.config do
      fore fore
      back back
      if padding
        pad_around do
          show
        end
      else
        show
      end
    end
  end

  macro show
    if Git.should_show?
      if Git.any_changes?
        snowflake
      else
        checkmark
      end
    else
      print "-"
    end
  end

end
