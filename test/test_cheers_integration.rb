require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_a_name_with_no_anChars
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("bwt")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Thanks, BWT
Give me a...B
Give me a...W
Give me a...T
Bwt's freakin awesome!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_no_anChars_a_different_way
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("bwt")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes_in_order shell_output, "Give me a...B", "Give me a...W", "Give me a...T"
  end

  def test_a_name_with_only_anChars
      shell_output = ""
      IO.popen('ruby cheers.rb', 'r+') do |pipe|
        pipe.puts("axh")
        pipe.close_write
        shell_output = pipe.read
      end
      expected_output = <<EOS
What's your name?
Thanks, AXH
Give me an...A
Give me an...X
Give me an...H
Axh's freakin awesome!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_mixed_characters
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("blah")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes_in_order shell_output, "Give me a...B", "Give me an...L", "Give me an...A", "Give me an...H"
  end

  def test_a_name_with_mixed_characters
      shell_output = ""
      IO.popen('ruby cheers.rb', 'r+') do |pipe|
        pipe.puts("blah")
        pipe.close_write
        shell_output = pipe.read
      end
      expected_output = <<EOS
What's your name?
Thanks, BLAH
Give me a...B
Give me an...L
Give me an...A
Give me an...H
Blah's freakin awesome!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_mixed_capitals_input
      shell_output = ""
      IO.popen('ruby cheers.rb', 'r+') do |pipe|
        pipe.puts("lORi")
        pipe.close_write
        shell_output = pipe.read
      end
      expected_output = <<EOS
What's your name?
Thanks, LORI
Give me an...L
Give me an...O
Give me an...R
Give me an...I
Lori's freakin awesome!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_no_input
      shell_output = ""
      IO.popen('ruby cheers.rb', 'r+') do |pipe|
        pipe.puts("")
        pipe.puts("abby")
        pipe.close_write
        shell_output = pipe.read
      end
      expected_output = <<EOS
What's your name?
Thanks, ABBY
Give me an...A
Give me a...B
Give me a...B
Give me a...Y
Abby's freakin awesome!
EOS
    assert_equal expected_output, shell_output
  end

#+++++++++++++++++++++++++++++++++++++++++
  def test_a_name_with_hyphen_input
      shell_output = ""
      IO.popen('ruby cheers.rb', 'r+') do |pipe|
        pipe.puts("bam-bam")
        pipe.close_write
        shell_output = pipe.read
      end
      expected_output = <<EOS
What's your name?
Thanks, BAM-BAM
Give me a...B
Give me an...A
Give me an...M
Give me a...B
Give me an...A
Give me an...M
Bam-Bam's freakin awesome!
EOS
    assert_equal expected_output, shell_output
  end

  def test_double_name_with_space_before_after_between
      shell_output = ""
      IO.popen('ruby cheers.rb', 'r+') do |pipe|
        pipe.puts(" billy bob ")
        pipe.close_write
        shell_output = pipe.read
      end
      expected_output = <<EOS
What's your name?
Thanks, BILLY BOB
Give me a...B
Give me an...I
Give me an...L
Give me an...L
Give me a...Y
Give me a...B
Give me an...O
Give me a...B
Billy Bob's freakin awesome!
EOS
    assert_equal expected_output, shell_output
  end


end