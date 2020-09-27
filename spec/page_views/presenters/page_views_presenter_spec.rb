# frozen_string_literal: true

RSpec.describe PageViews::Presenters::PageViewsPresenter do
  describe '#present_data' do
    subject { described_class.new(args) }

    let(:dummy_presenter_class) { double }
    let(:dummy_presenter) { double }
    let(:data) { [{ page: '/about/2', count: 90 }] }
    let(:args) { { my_type: data } }
    let(:data) { [{ page: '/help_page/1', ip: '929.398.951.889' }] }

    before do
      allow(dummy_presenter_class).to receive(:new).with(data).and_return(dummy_presenter)
      allow(dummy_presenter).to receive(:call).and_return(data)
    end

    it 'present an ordered list of page views' do
      expect(subject.present_data).to eq(
        [
          { type: :my_type, collection: data }
        ]
      )
    end
  end
end
