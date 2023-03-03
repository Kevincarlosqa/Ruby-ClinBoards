class Store

  def initialize()

  end 

  def start
    action = nil
    until action == "exit"
      print_clin_boards
    

    end
  end

  def create_board(index)

    @store.add_board
  end

  def update_board(id)

    @store.update_board
  end

  def delete_board(id)
    @store.delete_board(id)
  end

  def show_board

  end

# List Methods

  def create_list(name)

    @store.add_list
  end

  def update_list()

    @store.update_list
  end

  def delete_list()

    @store.delete_list
  end

  def create_card()

    @store.add_card
  end

  def update_card

    @store.update_card
  end


  def delete_card

    @store.delete_card
  end

  def card_checklist(id)

  end
end
require "json"
require_relative "board"

class Store
  attr_accessor :board
  def initialize(filename)
    @filename = filename
    @board = load
    # pp @board.id
  end

  def find_board(id)
    @board.find { |board| board.id == id }
  end

  private

  def load
    board_data = JSON.parse(File.read(@filename),symbolize_names:true)
    board_data.map{|board| Board.new(**board)}

    # p board_data.name
    # # p board_data.description
    # # p board_data.lists
  end

  
end

store = Store.new("store.json")
# p store.find_board(1).name