class Card 
    @@id_count = 0
    def initialize(id:, title:, members:, labels:, due_date:, check_list:)
      @@id_count += 1
      @id = @@id_count
      @title = title
      @members = members
      @labels = labels
      @due_date = due_date
      @check_list = check_list
      p @check_list
      p @title

    end

    private

    def next_id
        @@id_count += 1
    end
end

# data = {id: 1,
# title:"Check terminal-table gem",
# members:["Diego", "Deyvi", "Wences"],
# labels:["investigate"],
# due_date:"2023-02-19",
# check_list:[
#     {
#       "title": "Add gem to gemfile",
#       "completed": true
#     },
#     {
#       "title": "Make an example and share with the team",
#       "completed": false
#     },
#     {
#       "title": "Ask if this feature is mandatory",
#       "completed": true
#     }
#   ]
# }
# card1 = Card.new(**data)
