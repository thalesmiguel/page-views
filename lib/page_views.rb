# frozen_string_literal: true

require 'page_views/version'

require 'page_views/parsers'
require 'page_views/presenters'
require 'page_views/services'
require 'page_views/validators'

# Main App class
module PageViews
  # Default error class
  class Error < StandardError; end

  class << self
    def perform(file_path)
      parsed_file = Parsers::FileParser.new(file_path).call

      render(
        Presenters::PageViewsPresenter.new(
          {
            most_viewed: Services::GroupViewsService.new(parsed_file).call,
            unique_views: Services::GroupUniqueViewsService.new(parsed_file).call
          }
        ).present_data
      )
    end

    private

    def render(data)
      # Add render logic in here. For now, it's just a pretty print
      pp(data)
    end
  end
end
