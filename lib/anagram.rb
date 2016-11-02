require "anagram/version"
require "core_extensions/string/anagram"

module Anagram
  String.include CoreExtensions::String::Anagram

  def self.check(first_string, second_string)
    if first_string.anagram_of?(second_string)
      "#{first_string} is an anagram of #{second_string}"
    else
      "#{first_string} is NOT an anagram of #{second_string}"
    end
  end
end
