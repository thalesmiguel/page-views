# frozen_string_literal: true

RSpec.describe PageViews::Services::GroupUniqueViewsService do
  describe '#call' do
    subject { described_class.new(data) }

    let(:data) do
      [
        { page: '/help_page/1', ip: '929.398.951.889' },
        { page: '/about/2', ip: '382.335.626.855' },
        { page: '/home', ip: '336.284.013.698' },
        { page: '/about', ip: '929.398.951.889' },
        { page: '/help_page/1', ip: '836.973.694.403' },
        { page: '/contact', ip: '836.973.694.403' },
        { page: '/home', ip: '444.701.448.104' },
        { page: '/about/2', ip: '543.910.244.929' },
        { page: '/about', ip: '715.156.286.412' },
        { page: '/contact', ip: '184.123.665.067' },
        { page: '/home', ip: '444.701.448.104' },
        { page: '/index', ip: '184.123.665.067' },
        { page: '/about', ip: '336.284.013.698' }
      ]
    end

    it 'present an ordered list of page views' do
      expect(subject.call).to eq(
        [
          { page: '/help_page/1', count: 2 },
          { page: '/about/2', count: 2 },
          { page: '/home', count: 2 },
          { page: '/about', count: 3 },
          { page: '/contact', count: 2 },
          { page: '/index', count: 1 }
        ]
      )
    end
  end
end
