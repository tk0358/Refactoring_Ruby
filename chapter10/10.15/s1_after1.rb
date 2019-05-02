require 'uri'
require 'net/http'

class Person
  attr_accessor :first_name, :last_name, :ssn

  def save
    url = URI.parse('http://www.example.com/person')
    request = Net::HTTP::Post.new(url.path)
    request.set_form_data(
      "first_name" => first_name,
      "last_name" => last_name,
      "ssn" => ssn
    )
    Net::HTTP.new(url.host, url.port).start {|http| http.request(request) }
  end
end

class Company
  attr_accessor :name, :tax_id

  def save
    url = URI.parse('http://wwww.example.com/companies')
    request = Net::HTTP::Get.new(url.path + "?name=#{name}&tax_id=#{tax_id}")
    Net::HTTP.new(url.host, url.port).start {|http| http.request(request) }
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
    request = Net::HTTP::Post.new(url.path)
    attribute_hash = attributes.inject({}) do |result, attribute|
      result[attribute.to_s] = subject.send attribute
      result
    end
    request.set_form_data(attribute_hash)
    Net::HTTP.new(url.host, url.port).start {|http| http.request(request) }
  end

  def url
    URI.parse(to)
  end
end