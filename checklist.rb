class Checklist
  attr_reader :title, :completed
  def initialize(title:, completed:)
    @title = title
    @completed = completed
   
  end

  def show_checklist

    # until option == "back"
    #   print_card_checklist
    #   puts "---------------------"
    #   checklist_menu
    # end

  end

  def add_checklist
    print "Title: "
    title = gets.chomp
    { title: title, completed: false }
    @checklist << @checklist
  end 

  def toggle_checklist(id)

    card[:completed] = !card[:completed] if card
  
  end

  def delete_checklist(id)
    @checklist.delete_checklist(index - 1)
  end
  

  def checklist_menu
    puts "Checklist options: add | toggle INDEX | delete INDEX\nback"
    print "> "
    option, id = gets.chomp.split
    [option, id.to_i]
  end 

end


# data =  {
#   title: "Add gem to gemfile",
#   completed: true
# }
# nuevo = Checklist.new(**data)
# p nuevo.show_checklist
# p nuevo.add_checklist
# p nuevo.toggle_checklist
# p nuevo.delete_checklist