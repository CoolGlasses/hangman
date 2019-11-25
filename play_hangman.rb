require_relative "hangman"

hangman = Hangman.new

until hangman.game_over?
  puts "-----------------------------------"
  puts "Incorrect Guesses Remaining: #{hangman.remaining_incorrect_guesses}"
  puts
  puts "Attempted Chars: #{hangman.attempted_chars}"
  puts
  puts "Word: #{hangman.guess_word}"
  print "\n" until hangman.ask_user_for_guess
end
