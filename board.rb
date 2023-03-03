require_relative "lists"

class Board
  attr_accessor :id, :name, :description, :lists
  def initialize(id: nil, name:, description:, lists: [])
    @id = id
    @name = name
    @description = description
    @lists = load_lists(lists)
    # p @id
    # p @name
    # p @description
    # p @lists
  end

  def update(name:nil , description:nil)
    @name = name if name && !name.empty?
    @description = description if description && !description.empty?
  end
  def find_list(id)
    @lists.find {|list| list.id == id}
  end
  private

  def load_lists(listas)
    listas.map { |lista| Lists.new(**lista)}
  end


end