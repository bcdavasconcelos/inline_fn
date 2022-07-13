# frozen_string_literal: true

require 'test_helper'

class TestInlineFn < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::InlineFn::VERSION
  end

  def test_inline_fn_pandoc
    text = %(Lorem ipsum dolor sit amet[^1], consectetur adipisicing elit[^2], sed...
  [^1]: Text of fn 1
  [^2]: Text of fn 2)
    result = %(Lorem ipsum dolor sit amet^[Text of fn 1], consectetur adipisicing elit^[Text of fn 2], sed...)
    assert_equal result, text.inline_fn_pandoc
  end

  def test_inline_fn_mmd
    text = %(Lorem ipsum dolor sit amet[^1], consectetur adipisicing elit[^2], sed...
  [^1]: Text of fn 1
  [^2]: Text of fn 2)
    result = %(Lorem ipsum dolor sit amet[^Text of fn 1], consectetur adipisicing elit[^Text of fn 2], sed...)
    assert_equal result, text.inline_fn_mmd
  end

  def test_it_does_something_useful
    assert true
  end
end
