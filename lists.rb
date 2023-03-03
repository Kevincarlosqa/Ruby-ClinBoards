require_relative "cards"

class Lists
  attr_reader :id, :name, :cards
  def initialize(id:nil , name:, cards: [])
    @id = id
    @name = name
    @cards = load_cards(cards)
    p @id
    p @name
    # p @cards
  end

  private

  def load_cards(cards)
    cards.map { |card| Cards.new(**card)}
  end
end