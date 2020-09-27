# frozen_string_literal: true

RSpec.describe PageViews::Validators::FilePresenceValidator do
  describe '#call' do
    subject { described_class.new(file_path) }

    context 'when the file exists' do
      let(:file_path) { 'path/to/a/not/existent/file.log' }
      before { allow(File).to receive(:file?).with(file_path).and_return(false) }

      it 'raises an error' do
        expect { subject.call }.to raise_error(
          PageViews::Error, 'File not found. Please provide a valid file path.'
        )
      end
    end

    context 'when the file does not exist' do
      let(:file_path) { 'path/to/my/file.pdf' }
      before { allow(File).to receive(:file?).with(file_path).and_return(true) }

      it 'succeeds' do
        expect { subject.call }.not_to raise_error
      end
    end
  end
end
