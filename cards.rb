class Cards 
    @@id_count = 0
     attr_reader :id, :title, :members, :labels, :due_date, :checklist
    def initialize(id:, title:, members:, labels:, due_date:, checklist:[])
      @id = next_id(id)
      @title = title
      @members = members
      @labels = labels
      @due_date = due_date
      @checklist = checklist
      # p @check_list
      # p @title

    end

    def update(id)
      @title = id[:title] unless id[:title].empty?
      @members = id[:members] unless id[:members].empty?
      @labels = id[:labels] unless id[:labels].empty?
      @due_date = id[:due_date] unless id[:due_date].empty?
    end

    def to_a
      #hacer un array con los checklist
      [@id, @title, @members.join(", "), @labels.join(", "), @due_date, []]
    end
    private

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


