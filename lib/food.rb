class Food
  attr_reader(:type, :id)

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @id = attributes.fetch(:id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO food (name) VALUES ('#{@type}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end


  define_method(:==) do |another_food|
    self.type().==(another_food.type()).&(self.id().==(another_food.id()))
  end

  define_singleton_method(:all) do
    returned_food = DB.exec("SELECT * FROM food;")
    food = []
    returned_food.each() do |food|
      type = food.fetch("type")
      id = food.fetch("id").to_i()
      food.push(Food.new({:type => type, :id => id}))
    end
    food
  end

  define_singleton_method(:find) do |target_id|
    @id = target_id
    entered_food = DB.exec("SELECT * FROM food WHERE id = #{target_id};")
    @type = entered_food.first().fetch('type')
    Food.new({:type => @type, :id => @id})
  end
end
