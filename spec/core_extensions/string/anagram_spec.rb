require 'spec_helper'

describe CoreExtensions::String::Anagram do
  before { String.include described_class }

  describe '#anagram_of?' do
    let(:correct_anagrams) do
      [
        ["wisdom", "mid sow"],
        ["Seth Rogan", "Gathers No"],
        ["Schoolmaster", "The classroom"],
        ["Vacation Times", "I'm Not as Active"],
      ]
    end

    let(:incorrect_anagrams) do
      [
        ["Reddit", "Eat Dirt"],
        ["Astronomers", "Moon starer"],
        ["Dormitory", "Dirty Rooms"]
      ]
    end

    it 'is true for anagram' do
      correct_anagrams.each do |couple|
        couple.first.extend(described_class)

        expect(couple.first.anagram_of?(couple.last)).to eq(true)
      end
    end

    it 'is false for not anagram' do
      incorrect_anagrams.each do |couple|
        couple.first.extend(described_class)

        expect(couple.first.anagram_of?(couple.last)).to eq(false)
      end
    end
  end

  describe '::sorted_string_chars' do
    it 'returns all chars from string sorted alfabeticaly' do
      expect('wisdom'.sorted_chars).to eq(%w(d i m o s w))
    end
  end
end
