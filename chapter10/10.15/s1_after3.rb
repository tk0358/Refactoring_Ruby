require 'uri'
require 'net/http'

class Person
  attr_accessor :first_name, :last_name, :ssn

  def save
    PostGateway.save do |persist|
      persist.subject = self
      persist.attributes = [:first_name, :last_name, :ssn]
      persist.to = 'http://www.example.com/person'
    end
  end
end

class Company
  attr_accessor :name, :tax_id

  def save
    GetGateway.save do |persist|
      persist.subject = self
      persist.attributes = [:name, :tax_id]
      persist.to = 'http://www.example.com/campanies'
    end
  end
end

class Laptop
  attr_accessor :assigned_to, :serial_number

  def save
    url = URI.parse('http://wwww.example.com/issued_laptop')
    request = Net::HTTP::Post.new(url.path)
    request.basic_auth 'username', 'password'
    request.set_form_data(
      "assigned_to" => assigned_to,
      "serial_number" => serial_number
    )
    Net::HTTP.new(url.host, url.port).start {|http| http.request(request) }
  end
end

class Gateway
  attr_accessor :subject, :attributes, :to

  def self.save
    gateway = self.new
    yield gateway
    gateway.execute
  end

  def execute
    Net::HTTP.new(url.host, url.port).start do |http|
      http.request(build_request)
    end
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