class Checklist
  attr_reader :title, :completed
  def initialize(title:, completed:)
    @title = title
    @completed = completed
   
  end


  # methods
end
data =  {
  title: "Add gem to gemfile",
  completed: true
}
nuevo = Checklist.new(**data)
p nuevo.title
p nuevo.completed