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
    if desc.nil? or desc.empty?
      "Must enter description"
    else
      @list.push Item.new desc
    end
  end
  
  def mark_complete item
    @list[item].completed = true
  end

end
