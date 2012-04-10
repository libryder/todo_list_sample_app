require './todo_list'

describe 'list of todos' do
  before (:each) do
    @list = TodoList.new
  end
  
  it "returns the list" do
    @list.show_list[0].should be_an_instance_of Item
  end
  
  it "add a task" do
    @list.show_list.length.should == 1
    @list.add_task("figure this out")
    @list.show_list.length.should == 2
    
  end
  
  it "task will not be created without a description" do
    @list.add_task().should == "Must enter description"
  end
  
  it "checks off the task" do
    item = @list.show_list[0]
    @list.mark_complete(0)
    
    item.completed.should == true
  end
  
  it "does not return checked off task" do
    @list.add_task("New task")
    @list.mark_complete(1)
    
    @list.show_list.length.should == 1
  end
end
