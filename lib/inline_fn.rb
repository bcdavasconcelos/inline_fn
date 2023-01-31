# frozen_string_literal: false

require_relative 'inline_fn/version'

# Change markdown footnotes format from `[^1]/[^1]:Note` to inline Pandoc or MMD style `^[Note]/[^Note]`.
module InlineFn
  class Error < StandardError; end

  def inline_fn(text, style, *array_of_strs)
    # str is the text to be processed
    # style is the style of the inline footnote: :pandoc or :mmd
    # text is an optional array of strings `%w{fn cf}` that need to be removed from the footnotes before processing. This is useful in case you are converting Scrivener footnotes (`[^fn1]` or `[^cf1]`).
    ref_start = ''
    counter = 0

    array_of_strs.each do |str|
      text = text.gsub(/\[\^#{str}/, '[^')
    end

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
      # p text
      error_msg = <<~EOF
        ERROR: No cut point found.

        Footnotes should be in the format `[^1]` AND NOT `[^fn1]` or `[^cf1]`. If you are converting Scrivener markdown, please use the `scrivener_to_pandoc` (== inline_fn(self, :pandoc, 'fn', 'cf')) or `scrivener_to_mmd` (== inline_fn(self, :mmd, 'fn', 'cf')) methods.

        If you have footnotes in other formats, you can try the `inline_fn` method. It takes as arguments the text to be processed, the style of the inline footnote: :pandoc or :mmd, and an optional array of strings `%w{fn cf}` that need to be removed from the footnotes before processing.
EOF

      text = text[0, cut_point] rescue error_msg
      puts "#{counter -= 1} notes replaced."
    end
    text
  end

  def inline_fn_pandoc
    inline_fn(self, :pandoc)
  end

  def pandoc_fn
    inline_fn_pandoc
  end

  def inline_fn_mmd
    inline_fn(self, :mmd)
  end

  def mmd_fn
    inline_fn_mmd
  end

  def scrivener_to_pandoc
    inline_fn(self, :pandoc, 'fn', 'cf')
  end

  def scrivener_to_mmd
    inline_fn(self, :mmd, 'fn', 'cf')
  end

end

class String
  include InlineFn
end
