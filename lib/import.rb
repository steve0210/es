
class Import

  def initialize(in_file)
    in_file.each do |line|
      if m = line.match(/PASSWORD (.*) = (.*)/)
        passwords[m[1]] = m[2]
      end
    end
  end

  def passwords
    @passwords ||= {}
  end
end
