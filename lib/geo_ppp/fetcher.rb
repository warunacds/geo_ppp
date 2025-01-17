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
	 uri = URI(GEO_API_URL)
	 response = fetch_with_redirect(uri)
	 handle_response(response)
  end

  def self.fetch_ppp(geo)
	 uri = URI("#{PPP_API_URL}#{geo['country_code']}")
	 response = fetch_with_redirect(uri)
	 handle_response(response)
  end

  def self.fetch_with_redirect(uri, limit = 10)
	  raise 'Too many HTTP redirects' if limit.zero?

	  response = Net::HTTP.get_response(uri)
	  case response
	  when Net::HTTPRedirection
		 new_uri = URI(response['location'])
		 fetch_with_redirect(new_uri, limit - 1)
	  else
		 response
	  end
  end

  def self.handle_response(response)
	  if response.is_a?(Net::HTTPSuccess)
		 JSON.parse(response.body)
	  else
		 raise "HTTP Error: #{response.code} #{response.message}"
	  end
  end
end