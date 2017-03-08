def hangman()
  running = true
  attempts = 5
  guessed = []
  wordlist = File.readlines("myths-legends.txt")
  word = wordlist.sample
  hidden = []
  puts "Welcome to hangman!"
  puts "Guess the word!"
  puts "You have 5 attempts!"
  word.each_char do |x|
    hidden.push("_")
  end
  hidden.pop

  while running
    if guess == ""
      puts "Please type a letter"
      index = 0
      if attempts == 0
        puts "Really unfortunate. You lose!"
        running = false
      elsif hidden.include? ("_") == false
        puts "Congratulations! You won! You had #{attempts} left"
        running = false
      else
        guess = gets.chomp
        guess.upcase
        word.upcase
        word.each_char do |x|
          if guess == x
            hidden[index] = guess
            puts "Niiiiceeeee"

            index += 1
          end
        end
      end
    end
  end
end

hangman
