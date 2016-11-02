require 'spec_helper'

describe Anagram do
  describe '::process_file_and_save' do
    let(:iterator) { double(:iterator) }

    it "calls file iterator and saves result" do
      expect(Anagram::FileIterator).to receive(:new).with('source_file.txt').and_return(iterator)
      expect(iterator).to receive(:save_to).with('target_file.txt')

      described_class.process_file_and_save(source: 'source_file.txt', target: 'target_file.txt')
    end
  end
end
