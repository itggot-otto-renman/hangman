def hangman()
  puts "Welcome to Hangman!"
  puts "Try guessing the secret word!"
  puts "Put only one letter"
  running = true
  index = 0
  attempts = 5
  guessed = []
  wordlist = File.readlines("words-english.txt")
  word = wordlist.sample
  hidden = []
  word.each_char do |x|
    hidden.push("_ ")
  end
  hidden.pop
  word.upcase!

  while running
    while hidden.include?("_ ") == true
      puts "
      "
      guess = gets.chomp
      while guess.length > 1
        puts "Type only 1 letter"
        guess = gets.chomp
      end
      guessed << guess
      guess.upcase!
      index = 0
      if attempts == 0
        puts "You lose!"
        running = false
      end
      word.each_char do |x|
        if guess == x
          hidden[index] = guess + " "
        else
          attempts -= 1
        end
        index += 1
      end
      system "cls"
      hidden.each do |z|
        print z
      end
      puts "
      "

      guessed.to_s
      puts "Guessed letters: #{guessed}"

    end
    puts "

    "
    puts "Congtrats you win."
    puts "You had #{attempts} attempts left!"
    running = false
  end
end
hangman
