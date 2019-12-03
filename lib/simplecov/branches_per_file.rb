# frozen_string_literal: true

module SimpleCov
  # This module is responsible for generating a branch coverage report for certain file that is missed by the tests.
  # Doing something similar to https://ruby-doc.org/stdlib-2.5.3/libdoc/coverage/rdoc/Coverage.html can throw an error.
  # Errors can be related to Constants, modules are included/extended inside the file but not yet loaded or even exist.
  # It even can be a programmer's error.
  module BranchesPerFile
    #
    # @param [String] source_file_path
    #
    # @return [Hash]
    #
    def self.start(_source_file_path)
      {}
    end
  end
end
