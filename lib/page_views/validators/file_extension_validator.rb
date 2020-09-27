# frozen_string_literal: true

module PageViews
  module Validators
    # Validates a File's extension
    class FileExtensionValidator
      AVAILABLE_FILE_EXTENSIONS = %w[.log].freeze

      def initialize(file_path)
        @file_path = file_path
      end

      def call
        validate
      end

      private

      def validate
        return if AVAILABLE_FILE_EXTENSIONS.include?(File.extname(file_path))

        raise Error, "File format not supported. supported formats are: #{AVAILABLE_FILE_EXTENSIONS}."
      end

      attr_reader :file_path
    end
  end
end
