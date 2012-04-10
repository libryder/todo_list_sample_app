require './todo_list'

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
puts "Press 'e' + ENTER to edit description"
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
      result = @list.add_task desc.chomp!
      
      # hack
      if result.class == String
        puts result
      end
      print_list    
    when "e"
      puts "Enter todo ID"
      id = gets
      puts "Enter new description"
      desc = gets
      @list.edit_description Integer(id.chomp!), desc
      print_list
    when "q"
      running = false
    when 0..9999
      @list.mark_complete input
      print_list
  end
end
