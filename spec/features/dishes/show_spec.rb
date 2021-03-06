require 'rails_helper'

RSpec.describe "dish show page", type: :feature do
  before(:each) do
    @naftali = Chef.create!(name: "Naftali Schaechter")

    @lokshn_kugel = @naftali.dishes.create!(name: "Lokshn Kugel", description: "A classic, comforting sweet noodle pudding")
    @kishke = @naftali.dishes.create!(name: "Kishke", description: "Everyone's favorite stuffed intestine delight!")

    @noodles = Ingredient.create!(name: "Noodles", calories: 300)
    @eggs = Ingredient.create!(name: "Eggs", calories: 175)
    @cottage_cheese = Ingredient.create!(name: "Cottage Cheese", calories: 100)
    @sugar = Ingredient.create!(name: "Sugar", calories: 250)
    @cinnamon = Ingredient.create!(name: "Cinnamon", calories: 5)

    @casing = Ingredient.create!(name: "Casing", calories: 20)
    @schmaltz = Ingredient.create!(name: "Schmaltz", calories: 100)
    @matzo_meal = Ingredient.create!(name: "Matzo Meal", calories: 150)

    DishIngredient.create!(dish: @lokshn_kugel, ingredient: @noodles)
    DishIngredient.create!(dish: @lokshn_kugel, ingredient: @eggs)
    DishIngredient.create!(dish: @lokshn_kugel, ingredient: @cottage_cheese)
    DishIngredient.create!(dish: @lokshn_kugel, ingredient: @sugar)
    DishIngredient.create!(dish: @lokshn_kugel, ingredient: @cinnamon)

    DishIngredient.create!(dish: @kishke, ingredient: @casing)
    DishIngredient.create!(dish: @kishke, ingredient: @schmaltz)
    DishIngredient.create!(dish: @kishke, ingredient: @matzo_meal)
  end
  describe "When I visit a dish's show page" do
    it "I see a list of ingredients for that dish and the chef's name" do
      visit "/dish/#{@lokshn_kugel.id}"

      expect(page).to have_content(@lokshn_kugel.name)
      expect(page).to have_content(@noodles.name)
      expect(page).to have_content(@eggs.name)
      expect(page).to have_content(@cottage_cheese.name)
      expect(page).to have_content(@sugar.name)
      expect(page).to have_content(@cinnamon.name)
      expect(page).to have_content(@naftali.name)
    end
    it "I see the total calorie count for that dish" do
      visit "/dish/#{@lokshn_kugel.id}"
      expect(page).to have_content("Calories: #{@lokshn_kugel.total_calories}")

      visit "/dish/#{@kishke.id}"
      expect(page).to have_content("Calories: #{@kishke.total_calories}")
    end
  end
end
