# frozen_string_literal: true

module PageViews
  module Services
    # Groups a list of unique page views
    class GroupViewsBaseService
      def initialize(data)
        @data = data
      end

      def call(&block)
        raise Error, 'Must be given a block for desired transformation action.' unless block_given?

        data
          .group_by { |entry| entry[:page] }
          .transform_values(&block)
          .map { |page, count| { page: page, count: count } }
      end

      private

      attr_reader :data
    end
  end
end
