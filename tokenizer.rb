module RJSON
  
  class Tokenizer
    # First we declare regular expressions to use with the string scanner
    # These regular expressions were derived from the definitions on json.org
    STRING = /"(?:[^"\\]|\\(?:["\\\/brnrt]|u[0-9a-fA-F]{4}))*"/
    NUMBER = /-?(?:0|[1-9]\d*)(?:\.\d+)?(?:[eE][+-]?\d+)?/
    TRUE   = /true/
    FALSE  = /false/
    NULL   = /null/

    def initialize(io)
      # We instantiate a string scanner object in the constructor
      @ss = StringScanner.new(io.read)
    end

    def next_token
      return if @ss.eos?

      case
      when text = @ss.scan(STRING) then [:STRING, text]
      when text = @ss.scan(NUMBER) then [:NUMBER, text]
      when text = @ss.scan(TRUE)   then [:TRUE, text]
      when text = @ss.scan(FALSE)  then [:FALSE, text]
      when text = @ss.scan(NULL)   then [:NULL, text]
      else
        x = @ss.getch
        [x, x]
      end

    end
  end
  
end
