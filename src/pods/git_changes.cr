require "beeline"

class GitChangesPod
  def initialize(fore : Color, back : Color)
    Beeline.config do
      fore fore
      back back

      pad_around do
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
  end
end
