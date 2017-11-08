require "beeline"
require "./my-beeline/*"
require "./pods/*"

Orange = Cyan

macro transition(from, to)
  fore {{from}}
  # back Black
  # triangle_right
  # fore Black
  back {{to}}
  triangle_right
end

Beeline.config do
  UserPod.new(fore: Black, back: Green)

  transition(Green, Yellow)
  PathPod.new(fore: Black, back: Yellow)

  transition(Yellow, Orange)
  # EmptyPod.new(fore: Black, back: Orange)
  GitBranchPod.new(fore: Black, back: Orange)

  transition(Orange, Red)
  # EmptyPod.new(fore: Black, back: Red)
  GitChangesPod.new(fore: Black, back: Red)

  transition(Red, Magenta)
  EmptyPod.new(fore: Black, back: Magenta)
  # IpPod.new(fore: Black, back: Red)

  transition(Magenta, Blue)
  EmptyPod.new(fore: Black, back: Blue)

  fore Blue
  back Clear
  triangle_right

  newline
  fore Clear
  back Clear
  print "$"
  padding
end
