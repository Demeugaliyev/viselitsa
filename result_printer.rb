class ResultPrinter
  
  def initialize
    @status_image = []

    current_path = File.dirname(__FILE__)
    counter = 0

    while counter <= 7 do
      file_name = current_path + "/img/#{counter}.txt"

      if File.exist?(file_name)
        f = File.new(file_name, "r:UTF-8")

        @status_image << f.read

        f.close
      else
        @status_image << "\n[ can't find image ]\n"
      end
      counter += 1
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ""

    for letter in letters do
      if good_letters.include? letter
        result += letter + " "
      else
        result += "_ "
      end
    end
    return result
  end

  def print_status(game)
    system "clear"

    puts "\nWord: " + get_word_for_print(game.letters, game.good_letters)

    puts "wrong letters #{game.errors}: " + game.bad_letters.join(", ")

    print_viselitsa(game.errors)

    if game.errors == 7
      puts "You lose("
    elsif game.good_letters.size == game.letters.uniq.size
      puts "You win"
    else
      puts "you have #{7-game.errors} chances"
    end
  end

  def print_viselitsa(errors)
    puts @status_image[errors]
  end
end
