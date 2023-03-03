require_relative "store"

class ClinBoards
  def initialize(filename)
    @store = Store.new(filename)
    @boards = @store.boards
  end
# ---------------

#   def start
#     loop do
#       puts @store.board_table
#       puts board_menu
#       print "> "
      
#       option, id = gets.chomp.split # ["create"]

#       case option
#       when "create"
#         data = board_form
#         @store.add_board(data)
#       when "show ID"
#         show_board(id.to_i)
#       when "update ID"
#         data = board_form
#         @store.update_board(id.to_i, data)
#       when "delete ID"
#         @store.delete_board(id.to_i)
#       when "exit"
#         puts "Goodbye!"
#         break
#       end
#     end
#   end

#   private

#   def board_menu
#     "create | show ID | update ID | delete ID" #check
#   end

#   def board_form     #?
#     print "Name: "
#     name = gets.chomp
#     print "Description: "
#     description = gets.chomp

#     { name: name, description: description }
#   end

#   def show_board(board_id)
#     loop do
#       puts @store.board_table(board_id)
#       puts board_menu
#       print "> "
      
#       option, id = gets.chomp.split # ["create"]

#       case option
#       when "create"
#         data = list_form
#         @store.add_list(data, board_id)
#       when "update"
#         data = list_form
#         @store.update_list(id.to_i, data, board_id)
#       when "delete"
#         @store.delete_list(id.to_i, board_id)
#       when "back"
#         break
#       end
#     end
#   end

#   def board_menu
#     "create | update ID | delete ID | back"
#   end

#   def song_form
# #     Title: Pedro Navaja
#     # Artists: Ruben Blades, Willie Colon
#     # Album: Siembra
#     # Released: 1978
#     print "Title: "
#     title = gets.chomp
#     print "Artists: "
#     artists = gets.chomp.split(", ")
#     print "Album: "
#     album = gets.chomp
#     print "Released: "
#     released = gets.chomp

#     { title: title, artists: artists, album: album, released: released }
#   end
# end
# -------------------------
# Board Methods



 
end



# get the command-line arguments if neccesary
app = ClinBoards.new
app.start
