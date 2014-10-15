# coding: utf-8
class TaskQueue
  def initialize
    @tasks = {}
  end

  def add_queue(object, method, *args)
    @tasks[object] |= []
    @tasks[object] << {method => *args}
  end

  def execute
    @tasks.each do |obj, methods|
      methods.each do |method|
      	method.each do |k, v|
      	  obj.send(k, v)
      	end
      end
    end
  end
end