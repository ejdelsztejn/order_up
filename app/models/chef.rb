class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def most_popular_ingredients
    ingredient_count = Hash.new(0)
    self.dishes.each do |dish|
      dish.ingredients.each do |ingredient|
        ingredient_count[ingredient.name] += 1
      end
    end
    ingredient_count.sort_by{ |ingredient, count| count }.last(3).map{|ingredient| ingredient[0]}
  end
end
