# frozen_string_literal: true

module PageViews
  module Parsers
    # Parses a File of pages and IPs
    class FileLineParser
      def initialize(file_line)
        @file_line = file_line
      end

      def call
        file_line.split(' ').instance_eval { |page, ip| { page: page, ip: ip } }
      end

      private

      attr_reader :file_line
    end
  end
end
