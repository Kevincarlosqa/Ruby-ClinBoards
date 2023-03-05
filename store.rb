require "json"
require "terminal-table"
require_relative "board"
require_relative "lists"
require_relative "cards"

class Store
  attr_accessor :board, :filename
  def initialize(filename)
    @filename = filename
    @board = load
  end

  def find_board(id)
    @board.find { |board| board.id == id }
  end

  def create_board(board_data)
    @board << Board.new(**board_data)
    # save
  end

  def update_board(id,data)
    board = find_board(id)
    board.update(**data)
    # save
  end

  def delete_board(id)
    @board.delete_if { |board| board.id == id }
    # save
  end
  
  def create_list(list_data, board_id)
    board_id -= 1
    list = @board[board_id]
    list.lists << Lists.new(**list_data)
    # save
  end

  def update_list(name,board_pos)
    list = @board[board_pos].find_list_by_name(name)
    print "Name:"
    new_name = gets.chomp
    list.update(new_name)
  end

  def delete_list(name , board_id)
    board_id -= 1
    list = @board[board_id]
    list.lists
    list.lists.delete_if {|list| list.name == name}

    # save
  end

  def create_card(list_name,board_id)
    list = find_list(list_name,board_id)
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
    # save

  end

  def update_card(card_id, board_id)
    list = @board[board_id].lists[0].find_card(card_id)
    p list
    # card = list[1].find_card(card_id)
    # p card
    #falta la logica y el terminar el update
  end

  def delete_card(card_id, list_id,board_id)
    board = find_board(board_id)
    list = board.lists.find {|list| list.id == list_id}
    list.cards.delete_if {|card| card.id == card_id}
  end

  def card_checklist(card_id,board_id)
    board_id -= 1
  
    list = board[board_id].lists
    checklists = []
    name_card = []
    id = card_id.to_i
    list.each do |card|
        algo = card.cards.find { |card| card.id == id }
        
        if !algo.nil?
          name_card << algo.title
          algo.checklist.each do |check|
          checklists << check.title
        end
      end
      end
  
    check_menu(name_card,checklists)
    # checklists.each.with_index do |checl,index|
    #   p checl.checklist[index].title
    # end
    # p board
    # board.lists.find {|list| list.}

  end
  def check_menu(name_card = [],checklists = [])
    puts "Card: #{name_card[0]}"
    count = 0
    checklists.each do |check|
      count += 1
      puts "[ ] #{count}. #{check}"
    end
    puts "-------------------------------------"
  end

  def board_table
    table = Terminal::Table.new
    table.title = "CLIn Boards"
    table.headings = ["ID", "Name", "Description", "List(#cards)"]
    table.rows = @board.map(&:to_a)

    table
  end

  def list_table(board_id)
    name = []
    @board[board_id].lists.each_with_index do |names, index|
      name << names.name
    end
    name.each_with_index do |title, index|
     
      table2 = Terminal::Table.new
      table2.title = title
      table2.headings = ["ID", "Title", "Members", "Labels", "Due_date","Checklist"]
      list = @board[board_id].find_list_by_name(title)
      row = []
      list.cards.each_with_index do |card, index|
         row <<  card.to_a
      end
      table2.rows = row
      # table2.rows = cards
      puts table2
    end
    # table.headings = ["ID", "Title", "Members", "Labels", "Due_date","Checklist"]
    # table.rows = playlist.songs.map(&:to_a)

    # table
  end
  private

  def load
    board_data = JSON.parse(File.read(@filename), symbolize_names:true)
    board_data.map { |board| Board.new(**board) }
  end

  def save
    File.write(@filename, JSON.pretty_generate(@board))
  end
  
end
dat = {id: 2, name: "name", description: "description", lists: []}

data = {
  name: "EXTENDED" , description: "DESCRIPCION",
}
# store = Store.new("store.json")

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
# store.create_card("In Progress",1)
# pp store.board
# pp store.find_board(1).description
# store.delete_card(4,2,1)
# store.update_card(9,2,0)