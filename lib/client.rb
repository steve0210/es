require 'elasticsearch'
require 'elasticsearch/xpack'
require 'patron'
require 'yaml'

class Client

  attr_accessor :password, :user, :users, :roles

  def initialize(config_path, es_password, es_user = "elastic")
    self.password = es_password
    self.user = es_user
    self.users = YAML.load(File.read(File.join(config_path, "users.yml")))
    self.roles = YAML.load(File.read(File.join(config_path, "roles.yml")))
  end

  def send_users
    users.size > 0 && users.each do |name, body|
      client.xpack.security.put_user({
        username: name,
        body: body
      })
    end
  end

  def send_roles
    roles.size > 0 && roles.each do |name, body|
      client.xpack.security.put_role({
        name: name,
        body: body
      })
    end
  end

  def client
    @client ||= Elasticsearch::Client.new(
      url: %{http://#{user}:#{password}@elasticsearch:9200}
    )
  end
end
