require_relative 'lib/textrb/version'

# textrb.gemspec

Gem::Specification.new do |spec|
  spec.name          = "textrb"
  spec.version       = Textrb::VERSION
  spec.authors       = ["GPT-4", "Rene van Pelt"]
  spec.email         = ["rene@catadesk.com"]
  spec.summary       = %q{A Ruby gem for various text comparison algorithms}
  spec.description   = %q{textrb provides various text comparison algorithms like Jaro-Winkler, Levenshtein, and Cosine similarity.}
  spec.homepage      = "https://github.com/renevanpelt/textrb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", ">= 1.0", "< 2.0"
end
