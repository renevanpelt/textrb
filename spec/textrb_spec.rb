# spec/textrb_spec.rb

require 'spec_helper'
require 'textrb'

RSpec.describe Textrb do
  describe Textrb::JaroWinkler do
    it 'calculates the similarity between two strings' do
      similarity = Textrb::JaroWinkler.similarity('fitzgerald', 'fritzgerald')
      expect(similarity).to be_within(0.01).of(0.97)
    end

    it 'calculates the similarity between two strings, another example' do
      similarity = Textrb::JaroWinkler.similarity('V for Vendetta', 'The lion king')
      expect(similarity).to be_within(0.01).of(0.41)
    end

    it 'calculates the distance between two strings' do
      distance = Textrb::JaroWinkler.distance('hello', 'hallo')
      expect(distance).to be_within(0.003).of(0.12)
    end
  end

  describe Textrb::Levenshtein do
    it 'calculates the distance between two strings' do
      distance = Textrb::Levenshtein.distance('kitten', 'sitting', 1, 1, 1)
      expect(distance).to be_within(0.01).of(0.42857142857142855)
    end

    it 'calculates the distance between two strings, another example' do
      distance = Textrb::Levenshtein.distance('hello', 'hallo', 1, 1, 1)
      expect(distance).to be_within(0.01).of(0.2)
    end

    it 'calculates the distance between two strings, difficult example' do
      distance = Textrb::Levenshtein.distance('fortissimo', 'fort is emo', 1, 1, 1)
      expect(distance).to be_within(0.01).of(0.27)
    end

    it 'calculates the similarity between two strings' do
      similarity = Textrb::Levenshtein.similarity('Pirates of the carrebian', 'The pirates of the carrebean', 1, 1, 1)
      expect(similarity).to be_within(0.01).of(0.79)
    end
  end



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

  describe 'Custom Similarity Score Threshold' do
    it 'returns true if similarity is above the threshold' do
      threshold = 0.7
      is_similar = Textrb::JaroWinkler.similarity('hello', 'hallo') do |similarity|

        true
      end
      expect(is_similar).to be true
    end
  end
end
