require 'spec_helper'

describe OCR::DigitParser do
  zero = <<-DIGIT
 _ 
| |
|_|

  DIGIT

  one = <<-DIGIT
  |
  |
  |

  DIGIT

  digits = {
    0 => zero,
    1 => one
  }

  digits.each do |expected_integer, digit|
    context "For the following input: \n#{digit}" do

      subject { OCR::DigitParser.new(digit) }

      it 'returns the correct integer for the given input string' do
        subject.parse.should == expected_integer
      end

    end

  end

end

