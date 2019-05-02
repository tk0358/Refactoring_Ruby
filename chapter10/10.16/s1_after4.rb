require 'uri'
require 'net/http'

class DomainObject
  def http
    GatewayExpressionBuilder.new(self)
  end
end

class Person < DomainObject
  attr_accessor :first_name, :last_name, :ssn
  
  def save
    http.post(:first_name, :last_name).to(
      'http://wwww.example.com/person'
    )
  end
end

class Company < DomainObject
  attr_accessor :name, :tax_id

  def save
    http.get(:name, :tax_id).to('http://wwww.example.com/companies')
  end
end

class Laptop
  attr_accessor :assigned_to, :serial_number

  def save
    PostGateway.save do |persist|
      persist.subject = self
      persist.attributes = [:assigned_to, :serial_number]
      persist.authenticate = true
      persist.to = 'http://www.examaple.com/issued_laptop'
    end
  end
end

class Gateway
  attr_accessor :subject, :attributes, :to, :authenticate

  def self.save
    gateway = self.new
    yield gateway
    gateway.execute
  end

  def execute
    request = build_request(url)
    request.basic_auth 'username', 'password' if authenticate
    Net::HTTP.new(url.host, url.port).start {|http| http.request(build_request) }
  end

  def url
    URI.parse(to)
  end
end

class PostGateway < Gateway
  def build_request
    request = Net::HTTP::Post.new(url.path)
    attribute_hash = attributes.inject({}) do |result, attribute|
      result[attribute.to_s] = subject.send attribute
      result
    end
    request.set_form_data(attribute_hash)
  end
end

class GetGateway < Gateway
  def build_request
    parameters = attributes.collect do |attribute|
      "#{attribute}=#{subject.send(attribute)}"
    end
    Net::HTTP::Get.new("#{url.path}?#{parameters.join("&")}")
  end
end

class GatewayExpressionBuilder
  def initialize(subject)
    @subject = subject
  end

  def post(attributes)
    @attributes = attributes
    @gateway = PostGateway
  end

  def get(attributes)
    @attributes = attributes
    @gateway = GetGateway
  end

  def to(address)
    @gateway.save do |persist|
      persist.subject = @subject
      persist.attributes = @attributes
      persist.to = address
    end
  end
end