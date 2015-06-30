# 5. Ask Player if they want to hit or stay
# 6. If stay, Dealer's turn
# 7. If hit, give Player another card
# 8. Check if Player's cards are above 21; if so, Player busts
# 9. If Player's cards are below 21, ask if they want to hit or stay
# 10. Do this until they stay
# 11. If Dealer's cards < 14, hit
# 12. Otherwise, stay
# 13. Winner has cards that equal 21, or other person busts

require 'pry'

def calculate_total(cards)
  card_values = cards.map { |e| e[0] }

  total = 0
  card_values.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0 # accounts for J, Q, K
      total += 10
    else
      total += value.to_i
    end
  end

  # correct for Aces
  card_values.select { |e| e == "A" }.count.times do
    total -= 10 if total > 21
  end

  total
end

cards = %w(2 3 4 5 6 7 8 9 10 J Q K A)
suits = %w(Hearts Clubs Spades Diamonds)
deck = cards.product(suits)

puts "Welcome to Blackjack!"
puts "What's your name?"
name = gets.chomp
name.capitalize!
puts "Hello, #{name}, let's see if your luck holds out."

deck.shuffle!

player_cards = []
dealer_cards = []

def deal_player_card(player_cards, deck)
  player_cards << deck.pop
end

def deal_dealer_card(dealer_cards, deck)
  dealer_cards << deck.pop
end

deal_player_card(player_cards, deck)
deal_dealer_card(dealer_cards, deck)
deal_player_card(player_cards, deck)
deal_dealer_card(dealer_cards, deck)

puts "Your cards: #{player_cards[0]} and #{player_cards[1]}"
puts "Dealer cards: #{dealer_cards[0]} and #{dealer_cards[1]}"

player_total = calculate_total(player_cards)
dealer_total = calculate_total(dealer_cards)

p player_total
p dealer_total

puts "Would you like to hit or stay?"
puts "Select H for hit or S for stay."
choice = gets.chomp.downcase

if choice == "h"
  deal_player_card(player_cards, deck)
  puts "Your cards: #{player_cards[0]}, #{player_cards[1]}, #{player_cards[2]}"
  player_total = calculate_total(player_cards)
  p player_total
else choice == "s"
  puts "Dealer's turn."
end
