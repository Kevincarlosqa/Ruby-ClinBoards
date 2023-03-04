require_relative "lists"

class Board
  attr_reader :id, :name, :description, :lists
  
  @@id_count = 0

  def initialize(id: nil, name:, description:, lists: [])
    @id = next_id(id)
    @name = name
    @description = description
    @lists = load_lists(lists)
    # p @id
    # p @name
    # p @description
    # p @lists
  end

  def update(name:nil , description:nil)
    @name = name if name && !name.empty?
    @description = description if description && !description.empty?
  end
  # def find_list(name)
  #   @lists.find {|list| list.name == name}
  # end
  private

  def load_lists(listas)
    listas.map { |lista| Lists.new(**lista)}
  end

  def next_id(id)
    if id
      @@id_count = [@@id_count, id].max
      return id
    else
      @@id_count += 1
    end

    @@id_count
  end

end