require_relative "hangman"

hangman = Hangman.new

until hangman.game_over?
  puts "-----------------------------------"
  puts "##########This is Game Number: #{hangman.this_game_number}##########"
  puts
  puts "Incorrect Guesses Remaining: #{hangman.remaining_incorrect_guesses}"
  puts
  puts "Attempted Chars: #{hangman.attempted_chars}"
  puts
  puts "Word: #{hangman.guess_word}"
  puts
  choice = ""

  acceptable_choice = false
  while !acceptable_choice
    acceptable_choice = true
    puts "Would you like to save before continuing?(Y/N)"
    choice = gets.chomp

    if choice.downcase != "n" && choice.downcase != "y"
      acceptable_choice = false
      puts "Sorry, that input is not recognized."
      puts
    end
  end

  if choice.downcase == "n"
    puts
    hangman.ask_user_for_guess
  else        
    hangman.save
    puts "Game Number #{hangman.this_game_number} has been saved!"
    puts
    hangman.ask_user_for_guess
  end
end
