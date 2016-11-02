require 'spec_helper'

describe Anagram::FileIterator do
  let(:source_file_name) { 'source.txt' }
  let(:target_file_name) { 'target.txt' }
  let(:file) { double(:file) }

  subject { described_class.new(source_file_name) }

  describe "#iterate" do
    before do
      expect(File).to receive(:open).with(source_file_name, 'r').and_return(file)
      expect(file).to receive(:close)
    end

    it "iterates over a source file" do
      expect(file).to receive(:each_line).and_yield('a').and_yield('b')

      iterator = described_class.new(source_file_name)

      result = []
      iterator.iterate { |line| result << line }
      expect(result).to eq(["a", "b"])
    end

    it "closes connection anyway" do
      expect(file).to receive(:each_line).and_yield('a').and_yield('b').and_raise

      iterator = described_class.new(source_file_name)

      result = []
      expect do
        iterator.iterate { |line| result << line }
      end.to raise_error

      expect(result).to eq(["a", "b"])
    end
  end

  describe "#result" do
    it "iteratively parses lines" do
      expect(subject).to receive(:iterate).and_yield('a').and_yield('b')
      expect(Anagram::LineParser).to receive(:parse).with('a').and_return('result for a')
      expect(Anagram::LineParser).to receive(:parse).with('b').and_return('result for b')

      expect(subject.result).to eq(['result for a', 'result for b'])
    end
  end

  describe "#save_to" do
    it 'saves result to specified file' do
      expect(subject).to receive(:open).with('target.txt', 'w').and_yield(file)
      expect(subject).to receive(:result).and_return(%w(a b))
      expect(file).to receive(:puts).with('a')
      expect(file).to receive(:puts).with('b')

      subject.save_to('target.txt')
    end
  end
end
