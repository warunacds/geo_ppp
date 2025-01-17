# frozen_string_literal: true

require_relative "lib/geo_ppp/version"

Gem::Specification.new do |spec|
  spec.name = "geo_ppp"
  spec.version = GeoPpp::VERSION
  spec.authors = ["waruna"]
  spec.email = ["waruna@binarylogs.com"]

  spec.summary = "Fetch  purchasing power parity(PPP) based on user's geo location"
  spec.description = "A Ruby library to fetch PPP based on user's geolocation using freegeoip.com and purchasing-power-parity.com APIs."
  spec.homepage = "https://github.com/warunacds/geo_ppp"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/warunacds/geo_ppp"
  spec.metadata["changelog_uri"] = "https://github.com/warunacds/geo_ppp/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  # spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
  #   ls.readlines("\x0", chomp: true).reject do |f|
  #     (f == gemspec) ||
  #       f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
  #   end
  # end
  spec.files = Dir.glob("{lib/**/*,README.md,LICENSE.txt}").reject { |file| file.end_with?(".gem") }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
