# frozen_string_literal: true

require_relative "inline_fn/version"
require_relative "inline_fn/inline_mmd"
require_relative "inline_fn/inline_pandoc"
module InlineFn
  class Error < StandardError; end
  class InlineFn < StandardError; end  
end
