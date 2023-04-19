# lib/textrb/jaro_winkler.rb

module Textrb
  class JaroWinkler
    def self.similarity(str1, str2)
      1 - self.jaro_winkler_distance(str1, str2)
    end

    def self.distance(str1, str2)
      self.jaro_winkler_distance(str1, str2)
    end


     def self.jaro_distance(str1, str2)
      str1_len = str1.length
      str2_len = str2.length

      return 0.0 if str1_len == 0 || str2_len == 0

      match_distance = [(str1_len / 2 - 1), (str2_len / 2 - 1)].max

      str1_matches = Array.new(str1_len, false)
      str2_matches = Array.new(str2_len, false)

      matches = 0
      transpositions = 0

      str1_len.times do |i|
        start = [0, i - match_distance].max
        finish = [i + match_distance + 1, str2_len].min

        (start...finish).each do |j|
          next if str2_matches[j] || str1[i] != str2[j]

          str1_matches[i] = true
          str2_matches[j] = true
          matches += 1
          break
        end
      end

      return 0.0 if matches == 0

      k = 0
      str1_len.times do |i|
        next unless str1_matches[i]

        while !str2_matches[k]
          k += 1
        end

        transpositions += 1 if str1[i] != str2[k]
        k += 1
      end

      jaro = (matches / str1_len.to_f + matches / str2_len.to_f + (matches - transpositions / 2.0) / matches) / 3.0
      jaro
    end
    def self.jaro_winkler_distance(str1, str2, p = 0.1)
      jaro_similarity = jaro_distance(str1, str2)

      prefix = 0
      str1.each_char.with_index do |c, i|
        break if c != str2[i]

        prefix += 1
      end

      jaro_winkler_similarity = jaro_similarity + (prefix * p * (1 - jaro_similarity))
      jaro_winkler_distance = 1 - jaro_winkler_similarity
      jaro_winkler_distance
    end

  end
end
