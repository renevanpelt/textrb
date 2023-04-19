# spec/textrb_spec.rb

require 'spec_helper'
require 'textrb'

RSpec.describe Textrb do
  describe Textrb::JaroWinkler do
    it 'calculates the similarity between two strings' do
      similarity = Textrb::JaroWinkler.similarity('fitzgerald', 'fritzgerald')
      puts "similarity: #{similarity}"
      expect(similarity).to be_within(0.01).of(0.97)
    end

    it 'calculates the similarity between two strings, another example' do
      similarity = Textrb::JaroWinkler.similarity('V for Vendetta', 'The lion king')
      puts "similarity --: #{similarity}"
      expect(similarity).to be_within(0.01).of(0.41)
    end

    it 'calculates the distance between two strings' do
      distance = Textrb::JaroWinkler.distance('hello', 'hallo')
      puts "distance: #{distance}"
      expect(distance).to be_within(0.003).of(0.12)
    end
  end
  #
  # describe Textrb::Levenshtein do
  #   it 'calculates the distance between two strings' do
  #     distance = Textrb::Levenshtein.distance('kitten', 'sitting', 1, 1, 1)
  #     expect(distance).to eq(3)
  #   end
  # end
  #
  # describe Textrb::Cosine do
  #   it 'calculates the similarity between two strings' do
  #     similarity = Textrb::Cosine.similarity('hello world', 'world hello')
  #     expect(similarity).to be_within(0.001).of(1.0)
  #   end
  #
  #   it 'calculates the distance between two strings' do
  #     distance = Textrb::Cosine.distance('hello world', 'world hello')
  #     expect(distance).to be_within(0.001).of(0.0)
  #   end
  # end
  #
  # describe 'Custom Similarity Score Threshold' do
  #   it 'returns true if similarity is above the threshold' do
  #     threshold = 0.8
  #     is_similar = Textrb::JaroWinkler.similarity('hello', 'hallo') do |similarity|
  #       similarity >= threshold
  #     end
  #     expect(is_similar).to be(true)
  #   end
  # end
end
