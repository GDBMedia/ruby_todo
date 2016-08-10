require("sinatra/activerecord")
class Task

  define_method(:initialize) do |description|
    @description = description
  end

  define_method(:description) do
    @description
  end

  define_singleton_method(:all) do
     returned_tasks = DB.exec("SELECT * FROM tasks;")
     tasks = []
     returned_tasks.each() do |task|
       description = task.fetch("description")
       tasks.push(Task.new(description))
     end
     tasks
   end

   define_method(:save) do
      DB.exec("INSERT INTO tasks (description) VALUES ('#{@description}');")
    end
end
