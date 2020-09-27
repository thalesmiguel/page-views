# frozen_string_literal: true

module PageViews
  module Validators
    # Validates a File's extension
    class FilePresenceValidator
      def initialize(file_path)
        @file_path = file_path
      end

      def call
        validate
      end

      private

      def validate
        return if File.file?(file_path)

        raise Error, 'File not found. Please provide a valid file path.'
      end

      attr_reader :file_path
    end
  end
end
