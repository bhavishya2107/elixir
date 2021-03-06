defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  shuffle enum method to shuffle the items in list 
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  whether a card is present in the list
  """
  def contains(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  splits the deck into hand and remaining deck returns a tuple
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  to run a erlang method use `:erlang.method` <br/>save method saves the deck to a file with your filename
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # {status, binary} = File.read(filename)

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
