# frozen_string_literal: true

RSpec.describe PageViews::Validators::FileExtensionValidator do
  describe '#call' do
    subject { described_class.new(file_path) }

    context 'when the loaded file extension is not permitted' do
      let(:file_path) { 'path/to/my/file.pdf' }

      it 'raises an error' do
        expect { subject.call }.to raise_error(
          PageViews::Error, 'File format not supported. supported formats are: [".log"].'
        )
      end
    end

    context 'when the loaded file extension is permitted' do
      let(:file_path) { 'path/to/my/file.log' }

      it 'succeeds' do
        expect { subject.call }.not_to raise_error
      end
    end
  end
end
