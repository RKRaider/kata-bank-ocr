require 'spec_helper'

describe OCR::AccountNumberParser do

  describe 'parse' do

    let(:chars) do
      <<-CHARS
 _  _  _  _  _  _  _  _  _ 
| || || || || || || || || |
|_||_||_||_||_||_||_||_||_|

      CHARS
    end

    subject { OCR::AccountNumberParser.new(chars) }

    it 'returns an array representing the digits of the account number' do
      subject.parse.should == [0,0,0,0,0,0,0,0,0]
    end

  end

end

