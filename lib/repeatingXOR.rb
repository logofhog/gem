module RepeatingXOR

  class << self
    def encrypt(string, key)
      process(string, key)
    end

    def decrypt(string, key)
      result = process(make_readable(string), key)
      make_readable(result)
    end

    private

    def process(string, key) 
      result = ''
      index = 0
      string.each_byte do |l|
        c = xor_combination(char_to_hex(l), 
                            key[index % key.length].unpack('H*')[0])
        if c.length == 1
          c= '0' + c
        end
        result << c
        index += 1 
      end
      result
    end

    def char_to_hex(char)
        char.ord.to_s(16)
    end

    def xor_combination(letter, key)
      (letter.hex ^ key.hex).to_s(16)
    end

    def make_readable(string)
      [string].pack('H*')
    end
  end
end
