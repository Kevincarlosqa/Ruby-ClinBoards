require_relative "store"

class ClinBoards
  def initialize(filename)
    @store = Store.new(filename)
    # @boards = @store.boards
  end

  def start
    loop do
      puts welco
      puts @store.board_table
      puts board_menu
      puts "exit"
      print "> "
      option, id = gets.chomp.split

      case option
      when "create"
        # data = playlist_form
        # @store.add_playlist(data)
      when "show"
        show_board(id.to_i)
      when "update"
        # data = playlist_form
        # @store.update_playlist(id.to_i, data)
      when "delete"
        # @store.delete_playlist(id.to_i)
      when "exit"
        puts "Goodbye!"
        break
      end
    end
  end
      
  private
  def welco
    wel = <<-DELIMETER
####################################
#      Welcome to CLIn Boards      #
####################################
    DELIMETER
  end
  def board_menu
    "Board options: create | show ID | update ID | delete ID"
  end

  def list_menu
    "List options: create-list | update-list LISTNAME | delete-list LISTNAME"
  end

  def card_menu
    "Card options: create-card | checklist ID | update-card ID | delete-card ID"
  end

  def show_board(board_id)
    board_id -= 1
    loop do
      @store.list_table(board_id)
      puts list_menu
      print "> "
      break
      # option, id = gets.chomp.split # ["create"]

      # case option
      # when "create"
      #   data = list_form
      #   @store.add_list(data, board_id)
      # when "update"
      #   data = list_form
      #   @store.update_list(id.to_i, data, board_id)
      # when "delete"
      #   @store.delete_list(id.to_i, board_id)
      # when "back"
      #   break
      # end
    end
  end
end

# get the command-line arguments if neccesary
app = ClinBoards.new("store.json")
app.start
