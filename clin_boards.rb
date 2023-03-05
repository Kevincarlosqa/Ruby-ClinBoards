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
        data = board_form
        @store.create_board(data)
      when "show"
        show_board(id.to_i)
      when "update"
        data = board_form
        @store.update_board(id.to_i,data)
      when "delete"
        @store.delete_board(id.to_i)
      when "exit"
        puts "Goodbye!"
        break
      end
    end
  end
      
  private

  def board_form
    print "Name: "
    name = gets.chomp
    print "Description: "
    description = gets.chomp

    { name: name, description: description }
  end

  def list_form
    print "Name: "
    name = gets.chomp

    { name: name }
  end

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
      puts card_menu
      print "> "
      option, listname = gets.chomp.split

      if listname.is_a?(String)
        listname
      else
        listname.to_i
      end
      
      case option
      when "create-list"
        data = list_form
        @store.create_list(data, board_id)
      when "update-list"
        @store.update_list(listname,board_id)
      when "delete-list"
        @store.delete_list(listname , board_id)
      when "create-card"
        # data = list_form
        create_card(list_name,board_id)
        # @store.create_list(data, board_id)
      when "checklist"
        @store.card_checklist(listname,board_id)
        puts "Checklist options: add | toggle INDEX | delete INDEX"
        puts "back"
        print "> "
        option, index = gets.chomp.split

        case option
        when "add"

        when "toggle"

        when "delete"

        when "back"
          break
        end
        # @store.update_list(listname,board_id)
        
      when "update-card"
        @store.update_card(listname, board_id)
      when "delete-card"
        # @store.delete_list(listname , board_id)
      when "back"
        break
      end
    end
  end
end

# get the command-line arguments if neccesary
app = ClinBoards.new("store.json")
app.start
