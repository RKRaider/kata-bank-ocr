module OCR

  class DigitParser

    attr_reader :digit

    def initialize(digit)
      @digit = sanitize(digit)
    end

    def parse
      digits.key(digit)
    end

    private

    def digits
      {
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
    end

    # Helper method to strip all newline characters.
    #
    # digit - string to be sanitized
    #
    # Returns the string with all newlines removed.
    def sanitize(digit)
      digit.gsub(/\n+/, '')
    end

    def zero
      sanitize <<-DIGIT
 _ 
| |
|_|
      DIGIT
    end

    def one
      sanitize <<-DIGIT
  |
  |
  |
      DIGIT
    end

    def two
      sanitize <<-DIGIT
 _ 
 _|
|_ 
      DIGIT
    end

    def three
      sanitize <<-DIGIT
 _ 
 _|
 _|
      DIGIT
    end

    def four
      sanitize <<-DIGIT
   
|_|
  |
      DIGIT
    end

    def five
      sanitize <<-DIGIT
 _ 
|_ 
 _|
      DIGIT
    end

    def six
      sanitize <<-DIGIT
 _ 
|_ 
|_|
      DIGIT
    end

    def seven
      sanitize <<-DIGIT
 _ 
  |
  |
      DIGIT
    end

    def eight
      sanitize <<-DIGIT
 _ 
|_|
|_|
      DIGIT
    end

    def nine
      sanitize <<-DIGIT
 _ 
|_|
 _|
      DIGIT
    end

  end

end

