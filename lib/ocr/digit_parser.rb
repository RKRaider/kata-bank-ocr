module OCR

  class DigitParser

    attr_reader :digit

    def initialize(digit)
      @digit = digit
    end

    def parse
      digit.include?('_') ? 0 : 1
    end

  end

end

