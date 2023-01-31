# frozen_string_literal: false

require_relative 'inline_fn/version'

# Change markdown footnotes format from `[^1]/[^1]:Note` to inline Pandoc or MMD style `^[Note]/[^Note]`.
module InlineFn
  class Error < StandardError; end

  def inline_fn(str, style = :pandoc)
    ref_start = ''
    text = str
    counter = 0

    until ref_start.nil?
      counter += 1
      cite      = "[^#{counter}]"
      ref       = "[^#{counter}]:"
      ref_start = text.index(ref)
      break if ref_start.nil?

      next_ref = "[^#{counter + 1}]:"
      ref_end  = text.index(next_ref).nil? ? -1 : text.index(next_ref) - 2
      offset   = counter.to_s.length + 5
      note     = case style
                 when :mmd
                   "[^#{text[ref_start + offset..ref_end].strip}]"
                 else
                   "^[#{text[ref_start + offset..ref_end].strip}]"
                 end

      text = text.gsub(cite, note)
    end

    if counter >= 1
      case style
      when :mmd
        text = text.gsub(/\n\s*\[\^/, "\n[^")
        cut_point = text.index("\n[^")
      else
        text = text.gsub(/\n\s*\^\[/, "\n^[")
        cut_point = text.index("\n^")
      end

      text = text[0, cut_point]
      # puts "#{counter -= 1} notes replaced."
    end
    text
  end

  def inline_fn_pandoc
    inline_fn(self, :pandoc)
  end

  def inline_fn_mmd
    inline_fn(self, :mmd)
  end
end

class String
  include InlineFn
end
