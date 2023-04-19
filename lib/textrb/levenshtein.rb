module Textrb
  class Levenshtein < BaseAlgorithm
    def self.calculate_distance(str1, str2, insert_cost = 1, delete_cost = 1, replace_cost = 1)
      # Implement the Levenshtein distance algorithm
      matrix = Array.new(str1.length + 1) { Array.new(str2.length + 1) }

      (0..str1.length).each { |i| matrix[i][0] = i * delete_cost }
      (0..str2.length).each { |j| matrix[0][j] = j * insert_cost }

      (1..str1.length).each do |i|
        (1..str2.length).each do |j|
          if str1[i - 1] == str2[j - 1]
            cost = 0
          else
            cost = replace_cost
          end

          matrix[i][j] = [
            matrix[i - 1][j] + delete_cost,
            matrix[i][j - 1] + insert_cost,
            matrix[i - 1][j - 1] + cost
          ].min
        end
      end

      matrix[str1.length][str2.length].to_f / [str1.length, str2.length].max
    end

    def self.calculate_similarity(str1, str2, insert_cost = 1, delete_cost = 1, replace_cost = 1)
      # Implement the Levenshtein similarity algorithm
      distance = self.distance(str1, str2, insert_cost, delete_cost, replace_cost)

      similarity = 1 - distance
      similarity
    end
  end
end
