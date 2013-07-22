require 'spec_helper'

describe OCR::Account do

  describe '#checksum' do

    context 'when given a single digit in the final position' do
      [
        '000000001',
        '000000002',
        '000000003',
        '000000004',
        '000000005',
        '000000006',
        '000000007',
        '000000008',
        '000000009',
      ].each do |number|

        context "for the account number: #{number}" do
          subject { OCR::Account.new(number) }

          it 'returns the last digit' do
            expected_checksum = number[number.length - 1].to_i
            subject.checksum.should == expected_checksum
          end
        end

      end
    end

    context 'when calculating more than 1 digit' do
      subject { OCR::Account }

      it 'doubles the next-to-last digit' do
        account = subject.new('000000011')
        account.checksum.should == 3
      end

      it 'triples the third-to-last digit' do
        account = subject.new('000000111')
        account.checksum.should == 6
      end

      it 'quadruples the fourth-to-last digit' do
        account = subject.new('000001111')
        account.checksum.should == 10
      end

      it 'returns the remainder vs 11' do
        account = subject.new('000011111')
        account.checksum.should == 4
      end

      it 'handles any account number' do
        account = subject.new('345882865')
        account.checksum.should == 6
      end

    end

  end

  describe '#valid?' do
    context 'when its checksum is 0' do
      subject { OCR::Account.new('345892865') }
      it { should be_valid }
    end

    context 'when its checksum is nonzero' do
      subject { OCR::Account.new('345882865') }
      it { should_not be_valid }
    end
  end

end

