
module Textrb
  class BaseAlgorithm
    def self.similarity(*args)
      score = calculate_similarity(*args)

      if block_given?
        yield score
      else
        score
      end
    end

    def self.distance(*args)
      score = calculate_distance(*args)
      if block_given?
        yield score
      else
        score
      end
    end

    def self.calculate_similarity(*args)
      raise NotImplementedError, "The #{self.class.name} subclass must implement the 'calculate_similarity' method."
    end
  end
end