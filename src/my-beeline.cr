#!/usr/bin/env cashrun --release

require "beeline"

Beeline.config do
  if ENV["PWD"] == ENV["HOME"]
    print "~"
  else
    dirs = ENV["PWD"].split("/")[1..-1]
    if dirs.size > 1
      ellipsis
    end
    print "/"
    print dirs[-1]
    print "/"
  end

  pad_around do
    [Red, Yellow, Green, Cyan].each do |c|
      fore c
      print "❯"
    end
  end
end
