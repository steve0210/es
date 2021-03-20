require 'elasticsearch'
require 'elasticsearch/xpack'
require 'patron'
require 'yaml'

class Client

  attr_accessor :password, :users

  def initialize(es_password, users_file)
    self.password = es_password
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
      url: %{http://elastic:#{password}@elasticsearch:9200}
    )
  end
end
