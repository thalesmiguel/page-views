# frozen_string_literal: true

module PageViews
  module Presenters
    # PageViewsPresenter class that calls other presenters
    class PageViewsPresenter
      def initialize(**args)
        @args = args
      end

      def present_data
        args.map do |type, data|
          { type: type, collection: PageViewCounterPresenter.new(data).call }
        end
      end

      private

      attr_reader :args
    end
  end
end
