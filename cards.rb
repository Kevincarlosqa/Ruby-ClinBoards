class Cards 
    @@id_count = 0
    def initialize(id:, title:, members:, labels:, due_date:, checklist:[])
      @@id_count += 1
      @id = @@id_count
      @title = title
      @members = members
      @labels = labels
      @due_date = due_date
      @check_list = checklist
      # p @check_list
      # p @title

    end

    def update(id)
      @title = id[:title] unless id[:title].empty?
      @members = id[:members] unless id[:members].empty?
      @labels = id[:labels] unless id[:labels].empty?
      @due_date = id[:due_date] unless id[:due_date].empty?
    end

    private

    def next_id
        @@id_count += 1
    end

    

end

