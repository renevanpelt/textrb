# textrb
textrb is a Ruby gem that provides various text similarity and distance algorithms. The gem is designed to be simple to use and easy to integrate into your Ruby projects. With textrb, you can calculate similarity scores between strings using popular algorithms like Jaro-Winkler, Levenshtein, and more.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'textrb'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install textrb
```

## Usage
### Jaro-Winkler Distance

To calculate the Jaro-Winkler similarity score between two strings, use the Textrb.jaro_winkler method:

```ruby
require 'textrb'

similarity = Textrb::JaroWinkler.similarity('hello', 'hallo')
puts "Similarity: #{similarity}"

distance = Textrb::JaroWinkler.distance('hello', 'hallo')
puts "Distance: #{distance}"
```

### Levenshtein Distance

To calculate the Levenshtein distance between two strings, use the Textrb.levenshtein method:

```ruby
require 'textrb'

distance = Textrb::Levenshtein.similarity('kitten', 'sitting')
puts "Levenshtein distance: #{distance}"

distance = Textrb::Levenshtein.distance('kitten', 'sitting', 1, 1, 1)
puts "Levenshtein distance: #{distance}"
```


### Cosine Similarity
To calculate the cosine similarity between two strings, use the Textrb.cosine_similarity method:

```ruby
require 'textrb'

similarity = Textrb::Cosine.similarity('hello world', 'world hello')
puts "Cosine similarity: #{similarity}"

distance = Textrb::Cosine.distance('hello world', 'world hello')
puts "Cosine distance: #{distance}"
```

### Custom Similarity Score Threshold

You can set a custom threshold to consider the answer "close enough" by passing a block to the similarity methods:

```ruby
require 'textrb'

threshold = 0.8

is_similar = Textrb::JaroWinkler.similarity('hello', 'hallo') do |similarity|
  similarity >= threshold
end

puts "Strings are similar" if is_similar
=> Strings are similar
```

Alternatively, you can set the threshold globally:

```ruby
require 'textrb'

Textrb.similarity_threshold = 0.8

is_similar = Textrb::JaroWinkler.is_similar?('hello', 'hallo')

puts "Strings are similar" if is_similar
=> Strings are similar
```

Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/yourusername/textrb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code of conduct.

License
The gem is available as open-source under the terms of the MIT License.

Code of Conduct
Everyone interacting in the textrb project's codebases, issue trackers, chat rooms, and mailing lists is expected to follow the code of conduct.



