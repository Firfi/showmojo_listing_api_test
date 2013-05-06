require 'uri'
require 'net/http'

def main

  token = '989d89549e932d34ecc2a3403ba44871'
  address = 'https://dev.showmojo.com'

  @json = '{"listings":[{"code":"cd-1","available_date":"03/09/2013","address":"750 N Rush St","city":"Chicago","state":"IL","title":"2BR/2BA Apartment - Chicago","square_feet":"1237","highlights":"Laundry room, Dishwasher, Microwave, Refrigerator, Stainless steel appliances, Stove/Oven, Balcony, Deck, or Patio, Swimming pool, Air conditioning, Double pane windows, Cable-ready, High-speed internet, Doorman, Elevator, Secured entry, Granite countertop","bedrooms":"0","full_bathrooms":"5","partial_bathrooms":"0","pets":["Cats ok"],"rent":"8000"}]}'



  headers = {'Content-Type' => 'application/json', 'Accept' => 'application/json', 'Authorization' => "Token token=\"#{token}\""}
  uri = URI.parse(address + '/api/v1/listings')
  req = Net::HTTP::Post.new(address + '/api/v1/listings')
  req.body = @json

  headers.each{|k, v| req.add_field(k, v)}
  http = Net::HTTP.new(uri.host, uri.port)
  if address.start_with?('https://')
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  res = http.start do |h|
    h.request(req)
  end

  puts res.body

end

main