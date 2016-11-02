module Anagram
  class LineParser
    def initialize(source)
      @source = source
    end

    def parse
      return "\"#{@source}\" is incorrect" unless words

      "\"#{words.first}\" #{comparing_result} \"#{words.last}\""
    end

    def comparing_result
      if words.first.anagram_of?(words.last)
        "is an anagram of"
      else
        "is NOT an anagram of"
      end
    end

    def words
      return @words if @words
      matches = @source.match(/"([^"]*)"\s*\?\s*"([^"]*)"/)
      @words = matches[1, 2] if matches
    end

    def self.parse(line)
      self.new(line).parse
    end
  end
end
