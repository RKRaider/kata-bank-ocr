module OCR

  class DigitParser

    attr_reader :digit

    def initialize(digit)
      @digit = digit
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

    def zero
      <<-DIGIT
 _ 
| |
|_|

      DIGIT
    end

    def one
      <<-DIGIT
  |
  |
  |

      DIGIT
    end

    def two
      <<-DIGIT
 _ 
 _|
|_ 

      DIGIT
    end

    def three
      <<-DIGIT
 _ 
 _|
 _|

      DIGIT
    end

    def four
      <<-DIGIT
   
|_|
  |

      DIGIT
    end

    def five
      <<-DIGIT
 _ 
|_ 
 _|

      DIGIT
    end

    def six
      <<-DIGIT
 _ 
|_ 
|_|

      DIGIT
    end

    def seven
      <<-DIGIT
 _ 
  |
  |

      DIGIT
    end

    def eight
      <<-DIGIT
 _ 
|_|
|_|

      DIGIT
    end

    def nine
      <<-DIGIT
 _ 
|_|
 _|

      DIGIT
    end

  end

end

