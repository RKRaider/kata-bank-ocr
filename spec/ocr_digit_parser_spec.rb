require 'spec_helper'

describe OCR::DigitParser do

  it 'returns the correct integer for the given input string' do
    digit = <<-DIGIT
     _ 
    | |
    |_|

    DIGIT
    parser = OCR::DigitParser.new(digit)
    parser.parse.should == 0
  end

end

