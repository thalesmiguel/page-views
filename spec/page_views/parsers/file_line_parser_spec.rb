# frozen_string_literal: true

RSpec.describe PageViews::Parsers::FileLineParser do
  describe '#call' do
    subject { described_class.new(file_line) }
    let(:file_line) { "/my_page/1 336.284.013.698\n" }

    it 'returns a hash of pages and IPs' do
      expect(subject.call).to eq(
        { page: '/my_page/1', ip: '336.284.013.698' }
      )
    end
  end
end
