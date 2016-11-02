require "anagram/version"
require "core_extensions/string/anagram"
require "anagram/file_iterator"

module Anagram
  String.include CoreExtensions::String::Anagram

  def self.process_file_and_save(source:, target:)
    iterator = Anagram::FileIterator.new(source)
    iterator.save_to(target)
  end
end
