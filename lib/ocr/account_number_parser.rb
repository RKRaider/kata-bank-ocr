module OCR

  class AccountNumberParser

    ACCOUNT_NUMBER_LENGTH = 9
    DIGIT_HEIGHT = 3
    DIGIT_WIDTH  = 3

    attr_reader :input

    def initialize(input)
      @input = input
    end

    def parse
      digit_triplets = scan_lines(input)

      (0...account_number_length).reduce([]) do |account_numbers, position|
        account_numbers << account_number_at(digit_triplets, position)
      end
    end

    private

    def account_number_length
      ACCOUNT_NUMBER_LENGTH
    end

    def digit_height
      DIGIT_HEIGHT
    end

    def digit_width
      DIGIT_WIDTH
    end

    def build_digit_parser(digit_text)
      DigitParser.new(digit_text)
    end

    def scan_lines(text)
      text.scan /.{#{digit_width}}/
    end

    def account_number_at(text, position)
      digit = (0...digit_height).reduce('') do |digit_parts, line_index|
        offset = calculate_offset(line_index, position)
        digit_parts << text[offset]
      end

      scan_digit(digit)
    end

    def scan_digit(digit)
      digit_parser = build_digit_parser(digit)
      digit_parser.parse
    end

    def calculate_offset(line, position)
      position + (line * account_number_length)
    end

  end

end

