# Create item class to store attributes
class Item
  attr_accessor :description, :completed
  
  def initialize desc
    @description = desc
    @completed = false
  end
  
end

class TodoList
  def initialize
    @list = [Item.new("Write this program.")]
  end
  
  def show_list
    #only show completed items
    @list.reject do |item|
      item.completed
    end
  end
  
  def add_task desc=nil
    # the gets method will pass a carriage return - chomp will remove that
    if desc.chomp.empty?
      puts "Must enter description"
    else
      @list.push Item.new desc
    end
  end
  
  def mark_complete item
    @list[item].completed = true
  end

end

@list = TodoList.new

def print_list
  @list.show_list.each_with_index do |item, index|
    puts "#{index}. #{item.description}"
  end
end

print_list

puts "Press 'a' + ENTER to add a ToDo"
puts "Press <Num> + ENTER to mark a Todo done"
puts "Press 'q' + ENTER to quit"

running = true

while running
  input = gets
  
  # Attempt to pass input in to a new Integer to detect whether a string
  # or integer was entered 
  begin
    input = Integer input
  rescue
    input = input.chomp!
  end
    
  case input
    when "a"
      puts "Enter description"
      desc = gets
      @list.add_task desc
      print_list    
    when "q"
      running = false
    when 0..9999
      @list.mark_complete input
      print_list
  end
end