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