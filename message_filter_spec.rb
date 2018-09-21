require_relative 'message_filter' # require_relativeは相対パス

describe MessageFilter do
  shared_examples 'MessageFilter with argument "foo"' do
    it { is_expected.to be_detect('hello from foo') }
    it { is_expected.not_to be_detect('hello, world!') }
    it { expect(subject.ng_words).not_to be_empty }
  end

  context 'with argument "foo"' do
    subject { MessageFilter.new('foo') }
    it_behaves_like 'MessageFilter with argument "foo"'
    it 'ng_words size is 1' do
      expect(subject.ng_words.size).to eq 1
    end
  end

  context 'with argument "foo","bar"' do
  subject { MessageFilter.new('foo', 'bar') }
  it { is_expected.to be_detect('hello from bar') }
  it_behaves_like 'MessageFilter with argument "foo"'
  end
end