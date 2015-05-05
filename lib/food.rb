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
end
