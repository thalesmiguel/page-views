# frozen_string_literal: true

module PageViews
  module Parsers
    # Parses a File of pages and IPs
    class FileParser
      def initialize(file_path)
        @file_path = file_path
      end

      def call
        validate_file

        IO.foreach(file_path).map { |line| FileLineParser.new(line).call }
      end

      private

      def validate_file
        Validators::FilePresenceValidator.new(file_path).call
        Validators::FileExtensionValidator.new(file_path).call
      end

      attr_reader :file_path
    end
  end
end
