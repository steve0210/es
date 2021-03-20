require 'elasticsearch'
require 'elasticsearch/xpack'
require 'patron'
require 'yaml'

class Client

  attr_accessor :password, :user, :users

  def initialize(users_file, es_password, es_user = "elastic")
    self.password = es_password
    self.user = es_user
    self.users = YAML.load(File.read(users_file))
  end

  def send_users
    users.each do |name, body|
      client.xpack.security.put_user({
        username: name,
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
