# lib/textrb.rb

require 'textrb/base_algorithm'
require 'textrb/version'
require 'textrb/jaro_winkler'
require 'textrb/levenshtein'
require 'textrb/cosine'

module Textrb
  class Error < StandardError; end

  class << self
    attr_accessor :similarity_threshold, :case_sensitive

    def case_sensitive?
      @case_sensitive.nil? ? true : @case_sensitive
    end
  end

  self.similarity_threshold = 0.8
  self.case_sensitive = true
end
