require_relative "checklist"

class Cards 
    @@id_count = 0
     attr_reader :id, :title, :members, :labels, :due_date, :checklist
    def initialize(id:, title:, members:, labels:, due_date:, checklist:[])
      @id = next_id(id)
      @title = title
      @members = members
      @labels = labels
      @due_date = due_date
      @checklist = load_checklist(checklist)
      # p @check_list
      # p @title

    end
    def find_checklist(checklist_id)
      list = @checklist.find { |check| check.id == card_id }
      p list
    end
    def update(id)
      @title = id[:title] unless id[:title].empty?
      @members = id[:members] unless id[:members].empty?
      @labels = id[:labels] unless id[:labels].empty?
      @due_date = id[:due_date] unless id[:due_date].empty?
    end

    def to_a
      
      [@id, @title, @members.join(", "), @labels.join(", "), @due_date, []]
    end
    private

    def load_checklist(checklist)
      checklist.map { |check| Checklist.new(**check)}
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


# card_data = {
# id: 1,
# title: "Check terminal-table gem",
# members: ["Diego", "Deyvi", "Wences"],
# labels: ["investigate"],
# due_date: "2023-02-19",
# checklist: [
#   {
#     title: "Add gem to gemfile",
#     completed: true
#   },
# ]
# }

# check = Cards.new(**card_data)
# pp check.title


