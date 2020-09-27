# frozen_string_literal: true

module PageViews
  module Presenters
    # Parses a File of pages and IPs
    class PageViewCounterPresenter
      def initialize(data)
        @data = data
      end

      def call
        data
          .sort_by { |page_data| page_data[:count] }
          .reverse
      end

      private

      attr_reader :data
    end
  end
end
