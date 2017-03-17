def hangman()
  system "cls"
  puts "Welcome to Hangman!"
  puts "Guess the word!"
  puts "Put only one letter"
  attempts = 10
  puts "You have #{attempts} attempts"
  running = true
  rightguess = false
  index = 0
  guessed = []
  wordlist = File.readlines("myths-legends.txt")
  word = wordlist.sample
  word = word.chomp
  hidden = []
  word.each_char do |x|
    hidden.push("_ ")
  end
  word = word.upcase!
  hidden.each do |z|
    sleep 0.05
    print z
  end

  while running
    while hidden.include?("_ ") == true
      puts "
      "
      guess = gets.chomp
      while guess.length > 1
        puts "Type only 1 letter"
        guess = gets.chomp
      end
      while guess == "" || guess ==" "
        puts "Please type a letter"
        guess = gets.chomp
      end
      guessed << guess
      guess.upcase!
      index = 0
      rightguess = false
      word.each_char do |x|
        if guess == x
          hidden[index] = guess + " "
          rightguess = true
        else
          rightguess = false unless rightguess
        end
        index += 1
      end
      if rightguess == false
        attempts -= 1
      end
       system "cls"
      hidden.each do |z|
        print z
      end
      if attempts == 0
        puts "Unfortunate, you lose!"
        puts "The word was #{word}!"
        running = false
        break
      end
      if hidden.include?("_ ") == false
        puts "Congratulations! You won!"
        puts "You had #{attempts} attempts left!"
        puts "You guessed these letters: #{guessed}"
        running = false
        break
      end
      puts "
      "

      guessed.to_s
      puts "You have #{attempts} attempts left!"
      puts "Guessed letters: #{guessed}"
    end
  end
end
hangman
