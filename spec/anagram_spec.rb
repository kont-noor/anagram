require 'spec_helper'

describe Anagram do
  describe '::check' do
    it "writes correct message for anagram" do
      allow_any_instance_of(String).to receive(:anagram_of?).and_return(true)

      expect(subject.check('a', 'b')).to eq('a is an anagram of b')
    end

    it "writes incorrect message for not anagram" do
      allow_any_instance_of(String).to receive(:anagram_of?).and_return(false)

      expect(subject.check('a', 'b')).to eq('a is NOT an anagram of b')
    end
  end
end
