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