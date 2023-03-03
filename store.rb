require "json"
require_relative "board"

class Store
  attr_accessor :board, :filename
  def initialize(filename)
    @filename = filename
    @board = load
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
  def find_list(name)
    @lists.find {|list| list.name == name}
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

  def create_card(list_name)
    @lists.find_list {|list| list.name == list_name}
    # options = 
    # options.split(" | ")
    # puts options
    title = " "
    while title.empty?
      print "title: "
      title = gets.chomp
    end
    members = " "
    while members.empty?
      print "members: "
      members = gets.chomp.split(", ")
    end
    labels = " "
    while labels.empty?
      print "labels: "
      labels = gets.chomp
    end
    due_date = gets.chomp
    


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
store.update_list("Todo",list_data, 1)
# store.delete_board(1)

# pp store.board
# pp store.find_board(1).description