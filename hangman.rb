def hangman()
  system "cls"
  puts "Welcome to Hangman!"
  puts "Guess the word!"
  puts "Put only one letter"
  puts "You have 5 attempts left"
  running = true
  rightguess = true
  index = 0
  attempts = 5
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
    print z
  end

  while running
    while hidden.include?("_ ") == true
      puts "
      "
      guess = gets.chomp
      while guess == "" || guess ==" "
        puts "Please type a letter"
        guess = gets.chomp
      end
      while guess.length > 1
        puts "Type only 1 letter"
        guess = gets.chomp
      end
      guessed << guess
      guess.upcase!
      if attempts == 1
        puts "Unfortunate, you lose!"
        running = false
        break
      end


      word.each_char do |x|
        if guess == x
          hidden[index] = guess + " "
          rightguess = true
          index += 1
        else
          rightguess = false
        end
      end
      if rightguess != true
        attempts -= 1
      end
      # system "cls"
      hidden.each do |z|
        print z
      end
      if hidden.include?("_ ") == false
        puts "Congratulations! You won!"
        puts "You had #{attempts} attempts left!"
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
