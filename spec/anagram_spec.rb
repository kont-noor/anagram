require 'spec_helper'

describe Anagram do
  describe '::check' do
    it "writes correct message for anagram" do
      allow(subject).to receive(:anagram?).and_return(true)

      expect(subject.check('a', 'b')).to eq('a is an anagram of b')
    end

    it "writes incorrect message for not anagram" do
      allow(subject).to receive(:anagram?).and_return(false)

      expect(subject.check('a', 'b')).to eq('a is NOT an anagram of b')
    end
  end

  describe '::anagram?' do
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

    it 'is true for correct couples of words' do
      correct_anagrams.each do |couple|
        expect(subject.anagram?(*couple)).to eq(true)
      end
    end

    it 'is false for incorrect ones' do
      incorrect_anagrams.each do |couple|
        expect(subject.anagram?(*couple)).to eq(false)
      end
    end
  end

  describe '::sorted_string_chars' do
    it 'returns all chars from string sorted alfabeticaly' do
      expect(subject.sorted_string_chars('wisdom')).to eq(%w(d i m o s w))
    end
  end
end
