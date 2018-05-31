class Git
  # @@status : String = system("git status -b --porcelain")
  @@status : String = self.get_status

  def self.should_show?
    Dir.exists?(".git") && File.readable?(".git/HEAD")
  end

  def self.branch
    @@status.lines[0].strip[3..-1]
  end

  def self.any_changes?
    @@status.lines.size > 1
  end

  def self.get_status
    output = IO::Memory.new
    error = IO::Memory.new
    if should_show?
      process = Process.run("git", args: %w(status -b --porcelain), output: output, error: error)
      return output.to_s
    end

    ""
  end
end
