require_relative 'message_filter' # require_relativeは相対パス

describe MessageFilter, 'with argument "foo"' do
  before do
    @filter = MessageFilter.new('foo')
  end
  subject {@filter}
  it {
    is_expected.to be_detect('hello from foo')
  }
  it {
    is_expected.not_to be_detect('hello, world!') 
  } 
end