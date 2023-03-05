class Checklists
  def show_checklist(board_id, list_id, card_id)

    board_selected = find_board(board_id)
    list_selected = board.lists.find {|list| list.id == list_id}
    card_checklist = list.find_card(card_id)

    until option == "back"
      print_card_checklist(card_id)
      puts "---------------------"
      checklist_menu
    end

  end

  def add_checklist
    print "Title: "
    title = gets.chomp
    { title: title, completed: false }
    @checklist << checklist
  end 

  def toggle_checklist(id)

    card[:completed] = !card[:completed] if card
    card.toggle_checklist
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