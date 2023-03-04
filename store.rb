require "json"
require_relative "board"

class Store
  attr_accessor :board, :filename
  def initialize(filename)
    @filename = filename
    @board = load
    # p "-------------"
    # p @board[0].lists
    # pp @board.id
    # @lists = 
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

  def delete_board(id)
    @board.delete_if { |board| board.id == id }
    save
  end

#   def show_board

#   end

# # List Methods
  def find_list(name,board_id)
    list_find = find_board(board_id)
    lista = list_find.lists.find {|list| list.name == name}
  end
  def create_list(list_data, board_id)
    list = find_board(board_id)
    list.lists << Lists.new(**list_data)
    save
  end

  # def update_list(name, data, board_id)
  #   p  board_id.to_i
  #   boar = @board.find_board(board_id)
  #   p boar
  #   list = board.find_list(name)
  #   p "-----------"
  #   p list
  #   list.update(**data)
  #   save
  # end

  def delete_list(name , board_id)
    board = find_board(board_id)
    board.lists.delete_if {|list| list.name == name}
    save
  end

  def create_card(list_name,board_id)
    list = find_list(list_name,board_id)
    # options = 
    # options.split(" | ")
    # puts options
    print "title: "
    title = gets.chomp
    print "members: "
    members = gets.chomp.split(", ")
    print "labels: "
    labels = gets.chomp
    print "due_date"
    due_date = gets.chomp
    cards_data = {id: nil, title: title, members: members, labels: labels, due_date:due_date, checklist:[]}
    list.cards << Cards.new(**cards_data)
    pp list.cards
    save

  end
  

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

#  p store.find_board(1).name
#  store.create_board(data)
#store.update_board("1", data)
list_data = {
  id: 7,
  name: "ME CAMBIE",
  cards: []
}
# store.update_list("Todo",list_data, 1)
# store.delete_board(1)
store.create_card("In Progress",1)
# pp store.board
# pp store.find_board(1).description