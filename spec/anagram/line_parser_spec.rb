require 'spec_helper'
require 'anagram/line_parser'

describe Anagram::LineParser do
  let(:test_line) { "test line" }
  let(:result) { double(:result) }

  let(:source_lines) do
    [
      '"wisdom" ? "mid sow"',
      '"Seth Rogan" ? "Gathers No"',
      '"Reddit" ? "Eat Dirt"',
      '"Schoolmaster" ? "The classroom"',
      '"Astronomers" ? "Moon starer"',
      '"Vacation Times" ? "I\'m Not as Active"',
      '"Dormitory" ? "Dirty Rooms"',
      'some incorrect'
    ]
  end


  describe '::parse' do
    it "creates an instance of described class and calls #parse" do
      expect(described_class).to receive(:new).with(test_line).and_call_original
      expect_any_instance_of(described_class).to receive(:parse).and_return(result)

      expect(described_class.parse(test_line)).to eq(result)
    end
  end

  describe '#parse' do
    let(:results) do
      [
        '"wisdom" is an anagram of "mid sow"',
        '"Seth Rogan" is an anagram of "Gathers No"',
        '"Reddit" is NOT an anagram of "Eat Dirt"',
        '"Schoolmaster" is an anagram of "The classroom"',
        '"Astronomers" is NOT an anagram of "Moon starer"',
        '"Vacation Times" is an anagram of "I\'m Not as Active"',
        '"Dormitory" is NOT an anagram of "Dirty Rooms"',
        '"some incorrect" is incorrect'
      ]
    end

    it "replaces ? in the line with a result of checking for an anagram" do
      source_lines.each_with_index do |line, index|
        parser = described_class.new(line)

        expect(parser.parse).to eq(results[index])
      end
    end
  end

  describe "words" do
    it "returns words within quotes splitted by ?" do
      parser = described_class.new(source_lines.first)

      expect(parser.words).to eq(["wisdom", "mid sow"])
    end

    it "returns nil unless line matches required conditions" do
      parser = described_class.new('"word1" "word2"')

      expect(parser.words).to be_nil
    end
  end
end
