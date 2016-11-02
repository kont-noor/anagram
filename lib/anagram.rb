require "anagram/version"

module Anagram
  def self.check(first_string, second_string)
    if anagram?(first_string, second_string)
      "#{first_string} is an anagram of #{second_string}"
    else
      "#{first_string} is NOT an anagram of #{second_string}"
    end
  end

  def self.anagram?(first_string, second_string)
    sorted_string_chars(first_string) == sorted_string_chars(second_string)
  end

  def self.sorted_string_chars(string)
    string.sub(/\s/, '').scan(/\w/).map(&:downcase).sort
  end
end
