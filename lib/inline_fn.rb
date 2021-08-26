# frozen_string_literal: true

require_relative "inline_fn/version"

module InlineFn
  class Error < StandardError; end
  class String
    def inline_mmd
      text = self
      counter = 0
      pandoc_mode = false
      loop do
        counter += 1
        cite = "[^#{counter}]"
        ref = "[^#{counter}]:"
        ref_start = text.index(ref)
        break if ref_start.nil?
    
        next_ref = "[^#{counter + 1}]:"
        ref_end = text.index(next_ref).nil? ? -1 : text.index(next_ref) - 2
        offset = counter.to_s.length + 5
        note = pandoc_mode ? "^[#{text[ref_start + offset..ref_end].strip}]" : "[^#{text[ref_start + offset..ref_end].strip}]"
    
        text.gsub!(cite, note)
      end
    
      if counter >= 1
        text = pandoc_mode ? text.gsub(/\n\s*\^\[/, "\n^[") : text.gsub(/\n\s*\[\^/, "\n[^")
        cut_point = pandoc_mode ? text.index("\n^") : text.index("\n[^")
        text = text[0, cut_point]
        # puts "#{counter -= 1} notes replaced."
      end
      puts text
    end
  
    def inline_pandoc
    text = self    
    counter = 0
    pandoc_mode = true
    loop do
      counter += 1
      cite = "[^#{counter}]"
      ref = "[^#{counter}]:"
      ref_start = text.index(ref)
      break if ref_start.nil?
  
      next_ref = "[^#{counter + 1}]:"
      ref_end = text.index(next_ref).nil? ? -1 : text.index(next_ref) - 2
      offset = counter.to_s.length + 5
      note = pandoc_mode ? "^[#{text[ref_start + offset..ref_end].strip}]" : "[^#{text[ref_start + offset..ref_end].strip}]"
  
      text.gsub!(cite, note)
    end
  
    if counter >= 1
      text = pandoc_mode ? text.gsub(/\n\s*\^\[/, "\n^[") : text.gsub(/\n\s*\[\^/, "\n[^")
      cut_point = pandoc_mode ? text.index("\n^") : text.index("\n[^")
      text = text[0, cut_point]
      # puts "#{counter -= 1} notes replaced."
    end
    puts text
    end
  end
end
