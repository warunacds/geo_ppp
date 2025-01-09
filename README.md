# Geo Purchasing Power Parity

Sell your digital products at purchasing power parity for based on users country. Not everyone is able to pay for the default pricing of the high income world. Cup of Coffee in Colombia or Indonesia cost less than USA or Australia, apply same principal to your digital products and get more customers. This package is inspired by `purchasing-power-parity` npm and uses their API.

## Installation

Add this line to your application's Gemfile
```bash
gem 'geo_ppp'
```

and run bundle
```bash
bundle install
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install geo_pp
```

## Usage

```ruby
GeoPPPFetcher.fetch
```

will return a following json structure, you could use ```pppConversionFactor``` to convert it price based on user's geographic location

```ruby
{"countryCodeIsoAlpha2":"LK","countryCodeIsoAlpha3":"LKA","currenciesCountry":{"LKR":{"symbol":"Rs  රු","name":"Sri Lankan rupee"}},"currencyMain":{"exchangeRate":300.701498,"name":"USD","symbol":"$"},"ppp":10040.0,"pppConversionFactor":0.33}
```

```ruby
def index
	original_price = 79.99

	begin
		response = GeoPPPFetcher.fetch
		discounted_price = original_price * response['pppConversionFactor']
		data = { original_price: original_price, discounted_price: discounted_price }
		render json: { success: true, data: data }
	rescue StandardError => e
		render json: { success: false, error: e.message }, status: :unprocessable_entity
	end
end
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/geo_ppp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/geo_ppp/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the geo_ppp project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/geo_ppp/blob/master/CODE_OF_CONDUCT.md).
