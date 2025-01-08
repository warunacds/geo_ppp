require 'net/http'
require 'json'

class GeoPPPFetcher
  GEO_API_URL = 'https://freegeoip.app/json/'.freeze
  PPP_API_URL = 'https://api.purchasing-power-parity.com/?target='.freeze

  def self.fetch
	 geo = fetch_geo
	 fetch_ppp(geo)
  end

  private

  def self.fetch_geo
	 response = make_request(GEO_API_URL)
	 {
		country_code_iso_alpha2: response['country_code'],
		country_name: response['country_name']
	 }
  end

  def self.fetch_ppp(geo)
	 url = "#{PPP_API_URL}#{geo[:country_code_iso_alpha2]}"
	 ppp_response = make_request(url)
	 geo.merge(ppp: ppp_response['ppp'])
  end

  def self.make_request(url)
	 uri = URI(url)
	 response = Net::HTTP.get(uri)
	 JSON.parse(response)
  rescue StandardError => e
	 raise "Failed to fetch data from #{url}: #{e.message}"
  end
end