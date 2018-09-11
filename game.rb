class Game
  def initialize(input_word)
    @letters = get_letters(input_word)

    @errors = 0

    @good_letters = []
    @bad_letters = []

    @status = 0
  end

  def get_letters(input_word)
    if input_word == nil || input_word == ""
      abort "get you word"
    end

    return input_word.upcase.split("")
  end

  def ask_next_letter
    puts "enter you letter"

    letter = ""

    while letter == "" do
      letter = STDIN.gets.chomp
    end

    next_step(letter.upcase)
  end

  def next_step(letter)
    if @status == -1 || @status == 1
      return
    end

    if @good_letters.include?(letter) || @bad_letters.include?(letter)
      return
    end

    if @letters.include?(letter)
      @good_letters << letter

      if @good_letters.size == @letters.uniq.size
        @status = 1
      end
    else
      @bad_letters << letter

      @errors += 1

      if @errors >= 7
        @status = -1
      end
    end
  end

  def letters
    return @letters
  end

  def good_letters
    return @good_letters
  end

  def bad_letters
    return @bad_letters
  end

  def status
    @status
  end

  def errors
    @errors
  end
end
