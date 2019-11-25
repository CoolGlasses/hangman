require "byebug"

class Hangman
  DICTIONARY = []

  File.open("5desk.txt").each do |word|
    if word.length >= 5 && word.length <= 12
      DICTIONARY << word
    end
  end

  def self.random_word
      return DICTIONARY.sample 
  end 

  def initialize
    @secret_word = Hangman.random_word 
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = @secret_word.length - 1
  end

  def guess_word
      @guess_word 
  end

  def attempted_chars
      @attempted_chars
  end 

  def remaining_incorrect_guesses
      @remaining_incorrect_guesses
  end 

  def already_attempted?(char)
    if @attempted_chars.include?(char)
       return true
    else  
       return false 
    end 
  end 

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |letter, i|
      if letter == char
          indices << i  
      end 
    end 
    return indices 
  end 

  def fill_indices(char, array_of_indices)
    array_of_indices.each do |k|
      @secret_word.each_char.with_index do |letter, i|
        if k == i
          @guess_word[i] = char  
        end 
      end 
    end 
  end 

  def try_guess(char)
 
    
    if already_attempted?(char)
      p "that has already been attempted"
      return false 
    end 


    matching_indices = get_matching_indices(char)
    attempted_chars << char 
    
    if matching_indices == []
       @remaining_incorrect_guesses -= 1
    end 
    
    fill_indices(char, get_matching_indices(char))
    
    return true 
  
  end 

  def ask_user_for_guess
    p "Enter a char:"
    guess = gets.chomp
    return try_guess(guess)
  end 

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true 
    else  
      return false
    end 
  end 

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true 
    else  
      return false 
    end 
  end 

  def game_over?



    if win? == true || lose? == true
      p @secret_word
      return true 
    else  
      return false 
    end 
  end 



end
