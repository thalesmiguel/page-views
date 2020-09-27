# frozen_string_literal: true

module PageViews
  module Services
    # Groups a list of unique page views
    class GroupUniqueViewsService < GroupViewsBaseService
      def call
        super { |ips| ips.uniq.count }
      end
    end
  end
end
