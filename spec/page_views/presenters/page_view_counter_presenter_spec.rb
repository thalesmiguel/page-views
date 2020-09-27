# frozen_string_literal: true

RSpec.describe PageViews::Presenters::PageViewCounterPresenter do
  describe '#call' do
    subject { described_class.new(data) }

    let(:data) do
      [
        { page: '/help_page/1', count: 23 },
        { page: '/contact', count: 23 },
        { page: '/home', count: 23 },
        { page: '/about/2', count: 22 },
        { page: '/index', count: 23 },
        { page: '/about', count: 21 }
      ]
    end

    it 'present an ordered list of page views' do
      expect(subject.call).to eq(
        [
          { page: '/index', count: 23 },
          { page: '/home', count: 23 },
          { page: '/contact', count: 23 },
          { page: '/help_page/1', count: 23 },
          { page: '/about/2', count: 22 },
          { page: '/about', count: 21 }
        ]
      )
    end
  end
end
