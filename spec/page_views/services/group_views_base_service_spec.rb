# frozen_string_literal: true

RSpec.describe PageViews::Services::GroupViewsBaseService do
  describe '#call' do
    subject { described_class.new(data) }

    let(:data) { [{ page: '/help_page/1', ip: '929.398.951.889' }] }

    context 'when called without a block' do
      it 'raises an error' do
        expect { subject.call }.to raise_error(
          PageViews::Error, 'Must be given a block for desired transformation action.'
        )
      end
    end
  end
end
