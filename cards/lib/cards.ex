defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  # shuffle enum method to shuffle the items in list
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  # whether a card is present in the list
  def contains(deck, card) do
    Enum.member?(deck, card)
  end

  # splits the deck into hand and remaining deck returns a tuple
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
end
