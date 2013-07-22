require 'spec_helper'

# TODO: Remove all this duplication
describe OCR::DigitParser do
  zero = <<-DIGIT
 _ 
| |
|_|

  DIGIT

  one = <<-DIGIT
   
  |
  |

  DIGIT

  two = <<-DIGIT
 _ 
 _|
|_ 

  DIGIT

  three = <<-DIGIT
 _ 
 _|
 _|

  DIGIT

  four = <<-DIGIT
   
|_|
  |

  DIGIT

  five = <<-DIGIT
 _ 
|_ 
 _|

  DIGIT

  six = <<-DIGIT
 _ 
|_ 
|_|

  DIGIT

  seven = <<-DIGIT
 _ 
  |
  |

  DIGIT

  eight = <<-DIGIT
 _ 
|_|
|_|

  DIGIT

  nine = <<-DIGIT
 _ 
|_|
 _|

  DIGIT

  digits = {
    0 => zero,
    1 => one,
    2 => two,
    3 => three,
    4 => four,
    5 => five,
    6 => six,
    7 => seven,
    8 => eight,
    9 => nine
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

