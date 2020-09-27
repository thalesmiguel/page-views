# frozen_string_literal: true

RSpec.describe PageViews::Parsers::FileParser do
  describe '#call' do
    subject { described_class.new(file_path) }
    let(:file_path) { 'path/to/my/file.log' }
    let(:stream_data) do
      [
        "/my_page/1 336.284.013.698\n",
        "/my_page/2 200.017.277.774\n",
        "/my_page 543.910.244.929\n",
        "/my_page/1 336.284.013.698\n"
      ]
    end

    before do
      allow(subject).to receive(:validate_file).and_return(true)
      allow(IO).to receive(:foreach).with(file_path).and_return(stream_data.to_enum)
    end

    it 'returns a list of parsed data' do
      expect(subject.call).to eq(
        [
          { page: '/my_page/1', ip: '336.284.013.698' },
          { page: '/my_page/2', ip: '200.017.277.774' },
          { page: '/my_page', ip: '543.910.244.929' },
          { page: '/my_page/1', ip: '336.284.013.698' }
        ]
      )
    end
  end
end
