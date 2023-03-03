require "json"
require_relative "board"

class Store
  attr_accessor :board, :filename
  def initialize(filename)
    @filename = filename
    @board = load
    # pp @board.id
  end

  def find_board(id)
    @board.find { |board| board.id == id }
  end

  def create_board(board_data)
    @board << Board.new(**board_data)
    save
  end

  # def update_board(id,data)
  #   board = find_board(id)
  #   board.update(**data)
  #   save
  # end

#   def delete_board(id)
#     @store.delete_board(id)
#   end

#   def show_board

#   end

# # List Methods

  def create_list(list_data, board_id)
    list = find_board(board_id)
    list.lists << Lists.new(**list_data)
    save
  end

  # def update_list(id, data, board_id)
  #   board = find_board(board_id)
  #   p board
  #   list = board.find_list(id)
  #   p "-----------"
  #   p list
  #   list.update(**data)
  #   save
  # end

  def delete_list(name , board_id)
    board = find_board(board_id)
    board.lists.delete_if {|list| list.name == name}
    save
    pp board
  end

#   def create_card()

#     @store.add_card
#   end

#   def update_card

#     @store.update_card
#   end
#   def delete_card

#     @store.delete_card
#   end

#   def card_checklist(id)

#   end
  private

  def load
    board_data = JSON.parse(File.read(@filename), symbolize_names:true)
    # puts board_data
    board_data.map { |board| Board.new(**board) }
    # p board_data.name
    # # p board_data.description
    # # p board_data.lists
  end

  def save
    File.write(@filename, JSON.pretty_generate(@board))
  end
  
end
dat = {id: 2, name: "name", description: "description", lists: []}

data = {
  name: "EXTENDED" , description: "DESCRIPCION",
}
store = Store.new("store.json")
# p store.find_board(1).name
# store.create_board(dat)
# store.update_board("1", data)
list_data = {
  id: 7,
  name: "ME CAMBIE",
  cards: []
}
# store.update_list(2,list_data, 1)
store.delete_list("Todo" , 1)

