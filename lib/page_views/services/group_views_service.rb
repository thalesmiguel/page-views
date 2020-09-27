# frozen_string_literal: true

module PageViews
  module Services
    # Groups a list of page views
    class GroupViewsService < GroupViewsBaseService
      def call
        super(&:count)
      end
    end
  end
end
