require 'anagram/line_parser'

module Anagram
  class FileIterator
    def initialize(file_name)
      @file_name = file_name
    end

    def iterate
      f = File.open(@file_name, "r")

      begin
        f.each_line do |line|
          yield(line.chomp)
        end
      ensure
        f.close
      end
    end

    def result
      return @result if @result
      @result = []

      iterate { |line| @result << Anagram::LineParser.parse(line) }

      @result
    end

    def save_to(target)
      open(target, 'w') do |f|
        result.each do |item|
          f.puts item
        end
      end
    end
  end
end
