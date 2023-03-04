require_relative "cards"

class Lists
  attr_reader :id, :name, :cards

  @@id_count = 0

  def initialize(id:nil , name:, cards: [])
    @id = next_id(id)
    @name = name
    @cards = load_cards(cards)
    # p @id
    # p @name
    # p @cards
  end

  private

  def load_cards(cards)
    cards.map { |card| Cards.new(**card)}
  end

  def next_id(id)
    if id
      @@id_count = [@@id_count, id].max
      return id
    else
      @@id_count += 1
    end

    @@id_count
  end
end