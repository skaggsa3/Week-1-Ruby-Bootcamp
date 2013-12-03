def initial_cards
  cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  players_cards = []
  face = ["10", "Jack", "Queen", "King"]
  suit = ["Spades", "Diamonds", "Hearts", "Clubs"]
  players_suit = []
  previous = []

  2.times do |n|
    cards.shuffle!.sample
    face.shuffle!.sample
    suit.shuffle!.sample

    while true
      if previous[n] == suit[n]
        suit.shuffle!.sample
      else
        break
      end
    end

    case cards[n]
    when 10
      players_cards.push(cards[n])
      #face_card.push(face[n])
      players_suit.push(suit[n])
      puts "You draw card #{face[0]} of #{players_suit[n]}"
    when 11
      players_cards.push(cards[n])
      #face_card.push("Ace")
      players_suit.push(suit[n])
      puts "You draw card Ace of #{players_suit[n]}"
    else 
      players_cards.push(cards[n])
      players_suit.push(suit[n])
      puts "You draw card #{players_cards[n]} of #{players_suit[n]}"
    end
  end

  if players_cards[0] == 11 and players_cards[1] == 11
    total = 11 + 1
  end

  total = players_cards[0] + players_cards[1]

  puts "For a total of: #{total}"

  total
end

def hit(total)
  cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  players_cards = []
  face = ["10", "Jack", "Queen", "King"]
  suit = ["Spades", "Diamonds", "Hearts", "Clubs"]
  players_suit = []
  $prev_suit = []

  cards.shuffle!.sample
  face.shuffle!.sample
  suit.shuffle!.sample

  while true
    if $prev_suit[0] == suit[0] 
      suit.shuffle!.sample
      break
    else
      break
    end
  end

  case cards[0]
    when 10
      players_cards.push(cards[0])
      #face_card.push(face[n])
      players_suit.push(suit[0])
      puts "You draw card #{face[0]} of #{players_suit[0]}"
      $prev_suit = suit[0]
    when 11
      players_cards.push(cards[0])
      #face_card.push("Ace")
      players_suit.push(suit[0])
      puts "You draw card Ace of #{players_suit[0]}"
      $prev_suit = suit[0]
    else 
      players_cards.push(cards[0])
      players_suit.push(suit[0])
      puts "You draw card #{players_cards[0]} of #{players_suit[0]}"
      $prev_suit = suit[0]
  end
  total = total + players_cards[0]
end


def play_again
  while true
    puts "Would you like to play again? yes or no?"
    ans = gets.chomp.downcase
    if ans == "yes" || ans == "no"
      break
    else 
      puts "Lets try this again"
    end
  end
  ans
end



puts "Welcome! Lets play some black jack"
puts "First, lets get your name"
name = gets.chomp.downcase

bust = false
won = false

keep_playing = true

while keep_playing

  puts "Alright #{name} lets get your first two cards"
  player_running_total = initial_cards

  while true
    if player_running_total > 21
      puts "you are bust"
      break
    elsif player_running_total == 21
      puts "You won!"
      won = true
      break
    end

    puts "Would you like to hit or stay?"
    answer = gets.chomp.downcase

    if answer == "hit"
      player_running_total = hit(player_running_total)
      if player_running_total > 21
        puts "O man! You busted"
        bust = true
        break
      elsif player_running_total == 21
        puts "You won! With a total of 21"
        won = true
        break
      else
        puts "You currently have #{player_running_total}"
      end
    elsif answer == "stay"
      puts "OK, lets give the dealer a shot at beating #{player_running_total}"
      break
    else
      puts "Try again: hit or stay"
    end
  end

  

  if bust == true 
    answer = play_again
      if answer == "yes"
        next
      else
        break
      end
  elsif won == true 
    answer == play_again
      if answer == "yes"
        next
      else
        break
      end
  end
    
  puts "The dealer will now draw"
  dealer_running_total = initial_cards
    

  while true
    if dealer_running_total > 21
      puts "You won! The dealer has went bust with a total of #{dealer_running_total}"
      break
    elsif dealer_running_total < player_running_total
      dealer_running_total = hit(dealer_running_total)
      if dealer_running_total > 21
        puts "You won! The dealer went bust with a total of #{dealer_running_total}"
        break
      elsif dealer_running_total > player_running_total and dealer_running_total <= 21
        puts "The dealer has won with a total of #{dealer_running_total}"
        break
      elsif dealer_running_total == 21
        puts "The dealer has won with a total of 21"
        break
      end
    elsif dealer_running_total == 21
      puts "The dealer has won with a total of 21"
      break
    elsif dealer_running_total > player_running_total
      puts "The dealer has won with a total of #{dealer_running_total}"
      puts "The dealer's current total is #{dealer_running_total}"
      break
    elsif dealer_running_total == player_running_total
      dealer_running_total = hit(dealer_running_total)
      puts "The Dealers total is #{dealer_running_total}"
    end
  end

  still_playing = play_again
  
  if still_playing == "yes"
    puts "Sweet, lets play again"
    next
  else
    puts "Alright, good game!"
    break
  end
  
end