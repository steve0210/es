
class Import
  ENV = {
    "kibana_system" => ["ELASTICSEARCH_PASSWORD"]
  }

  def initialize(in_file, env_file)
    process_in(in_file)
    process_env(env_file)
  end

  def process_in(in_file)
    in_file.each do |line|
      if m = line.match(/PASSWORD (.*) = (.*)/)
        passwords[m[1]] = m[2].strip
      end
    end
  end

  def process_env(env_file)
    File.readlines(env_file).map(&:strip).each do |line|
      lines << (match(line) || line)
    end
  end

  def match(line)
    passwords.each do |key, value|
      (envs = ENV[key]) && envs.each do |env|
        if m = line.match(/#{env}=/)
          return "#{env}=#{value}"
        end
      end
    end
    nil
  end

  def lines
    @lines ||= []
  end

  def passwords
    @passwords ||= {}
  end
end
