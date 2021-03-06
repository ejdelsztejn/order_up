require 'rails_helper'

RSpec.describe "chef show page", type: :feature do
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
  describe "When I visit a chef's show page" do
    it "I see the name of that chef" do
      visit "/chef/#{@naftali.id}"
      expect(page).to have_content(@naftali.name)
    end
    it "I see a link to view a list of all ingredients that this chef uses in their dishes" do
      visit "/chef/#{@naftali.id}"
      expect(page).to have_link("View All Ingredients Used by #{@naftali.name}")
    end
    describe "When I click on that link" do
      it "I'm taken to a chef's ingredient index page" do
        visit "/chef/#{@naftali.id}"

        click_link("View All Ingredients Used by #{@naftali.name}")
        expect(current_path).to eq("/ingredients/#{@naftali.id}")
      end
      it "I can see a unique list of names of all the ingredients that this chef uses" do
        visit("/ingredients/#{@naftali.id}/")

        expect(page).to have_content(@noodles.name)
        expect(page).to have_content(@eggs.name)
        expect(page).to have_content(@cottage_cheese.name)
        expect(page).to have_content(@sugar.name)
        expect(page).to have_content(@cinnamon.name)
        expect(page).to have_content(@casing.name)
        expect(page).to have_content(@schmaltz.name)
        expect(page).to have_content(@matzo_meal.name)
        expect(page).to have_content(@naftali.name)
      end
    end
    it "I see the three most popular ingredients that the chef uses in their dishes" do
      matzo_ball_soup = @naftali.dishes.create!(name: "Potato Kugel", description: "A warm soup to accompany any shabbos meal")
      broth = Ingredient.create!(name: "Chicken Broth", calories: 100)
      DishIngredient.create!(dish: matzo_ball_soup, ingredient: @noodles)
      DishIngredient.create!(dish: matzo_ball_soup, ingredient: @schmaltz)
      DishIngredient.create!(dish: matzo_ball_soup, ingredient: @matzo_meal)
      DishIngredient.create!(dish: matzo_ball_soup, ingredient: broth)

      visit "/chef/#{@naftali.id}"

      expect(page).to have_content("Most Popular ingredients:")
      expect(page).to have_content("Matzo Meal")
      expect(page).to have_content("Noodles")
      expect(page).to have_content("Schmaltz")
    end
  end
end
