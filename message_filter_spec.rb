require_relative 'message_filter' # require_relativeは相対パス

describe MessageFilter do
  it 'detects message with NG word' do
    filter = MessageFilter.new('foo')
    expect(filter.detect?('hello from foo')).to  eq true
  end
end