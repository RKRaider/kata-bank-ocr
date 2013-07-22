module OCR

  class Account

    attr_reader :number

    def initialize(number)
      @number = number
    end

    def valid?
      checksum == 0
    end

    def checksum
      checksum_total % 11
    end

    private

    def checksum_total
      (0...number.length).reduce(0) do |sum, index|
        sum += number[index * -1].to_i * index
      end
    end

  end

end

