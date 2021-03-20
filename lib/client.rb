require 'elasticsearch'
require 'elasticsearch/xpack'
require 'patron'

class Client

  attr_accessor :password

  def initialize(es_password)
    self.password = es_password
  end

  def client
    @client ||= Elasticsearch::Client.new(
      url: %{http://elastic:#{password}@elasticsearch:9200}
    )
  end
end
