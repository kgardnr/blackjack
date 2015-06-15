# 1. Create a deck of cards
# 2. Shuffle cards
# 3. Deal starting with Player, until both have 2 cards
# 4. Display cards
# 5. Ask Player if they want to hit or stay
# 6. If stay, Dealer's turn
# 7. If hit, give Player another card
# 8. Check if Player's cards are above 21; if so, Player busts
# 9. If Player's cards are below 21, ask if they want to hit or stay
# 10. Do this until they stay
# 11. If Dealer's cards < 14, hit
# 12. Otherwise, stay
# 13. Winner has cards that equal 21, or other person busts


#52 cards in a deck
#4 suits
#13 cards per suit

cards = %w(2 3 4 5 6 7 8 9 10 J Q K A)
suits = %w(Hearts Clubs Spades Diamonds)
deck = suits.product(cards)

p deck


