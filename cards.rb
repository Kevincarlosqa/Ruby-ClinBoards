

class Cards
  attr_reader :title
  def initialize(id:, title:, members:, labels:, due_date:, checklist: [])
    @id = id
    @title = title
    @members = members
    @labels = labels
    @due_date = due_date
    @checklist = checklist

    # p @id
    # p @title
    # p @members
    # p @labels
    # p @due_date
    # p @checklist
  end
end
     