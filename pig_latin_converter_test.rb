require 'minitest/autorun'
require 'minitest/pride'
require_relative 'pig_latin_converter'

class PigLatinConverterTest < Minitest::Test

  def test_first_three_match_passes_with_match
    word = "split"

    assert first_three_match(word)
  end

  def test_first_three_match_fails_without_match
    word_1 = "banana"
    word_2 = "apple"
    word_3 = "cherry"

    refute first_three_match(word_1)
    refute first_three_match(word_2)
    refute first_three_match(word_3)
  end

  def test_first_two_match_passes_with_match
    word = "cherry"

    assert first_two_match(word)
  end

  def test_first_two_match_fails_without_match
    word_1 = "apple"
    word_2 = "banana"

    refute first_two_match(word_1)
    refute first_two_match(word_2)
  end

  def test_convert_to_pig_latin_with_vowel_beginning
    word = "apple"

    assert_equal "appleyay", convert_to_pig_latin(word)
  end

  def test_convert_to_pig_latin_with_double_consonant_cluster
    word = "cherry"

    assert_equal "errychay", convert_to_pig_latin(word)
  end

  def test_convert_to_pig_latin_with_triple_consonant_cluster
    word = "split"

    assert_equal "itsplay", convert_to_pig_latin(word)
  end

  def test_punctuated
    question = "this is a question?"
    exclamation = "this is an exclamation!"
    none = "this is neither"

    assert punctuated?(question)
    assert punctuated?(exclamation)
    refute punctuated?(none)
  end
end
