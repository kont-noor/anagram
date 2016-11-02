module CoreExtensions
  module String
    module Anagram
      def anagram_of?(string)
        self.sorted_chars == string.sorted_chars
      end

      def sorted_chars
        self.sub(/\s/, '').scan(/\w/).map(&:downcase).sort
      end
    end
  end
end
