# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

receipts = [
	{
		name: "Fruit salad",
		link: "https://www.patee.ru/recipes/desserts/view/?id=1021364",
		ingredients: [
			"grape",
			"banana",
			"apple",
			"sugar",
			"sour-cream"
		]
	},
	{
		name: "Omelet",
		link: "http://www.calorizator.ru/recipe/45724",
		ingredients: [
			"cheese",
			"eggs",
			"milk",
			"tomatoes"
		]
	},
	{
		name: "Salad with tomatoes and peppers",
		link: "https://webspoon.ru/receipt/salat-iz-pomidorov-i-perca-so-smetanojj",
		ingredients: [
			"garlic",
			"tomatoes",
			"sweet-pepper",
			"sour-cream",
			"salt"
		]
	},
	{
			name: "Chees balls",
			link: "https://eda.ru/recepty/zakuski/sirnie-shariki-na-skovorode-40671",
			ingredients: [
				"cheese",
				"flour",
				"eggs",
				"salt"
			]
		},
		{
			name: "Pepper and cheese",
			link: "https://gotovim-doma.ru/recipe/667-zakuska-iz-pertsa-s-syrom-svetofor",
			ingredients: [
				"garlic",
				"cheese",
				"sweet pepper",
				"sour-cream",
				"salt"
			]
		},
		{
			name: "Lemonade",
			link: "https://www.passion.ru/food/sostavlyaem-menyu/domashniy-limonad-10-luchshih-receptov-78028.htm",
			ingredients: [
				"lemon",
				"water",
				"sugar"
			]
		},
		{
			name: "Salad with carrot and cheese",
			link: "http://pojrem.ru/salad/s-morkovju-syrom-i-chesnokom/",
			ingredients: [
				"garlic",
				"carrot",
				"cheese",
				"sour-cream",
				"salt"
			]
		},
		{
			name: "Fried cheese",
			link: "https://prostokvashino.ru/recipes/syr-zharenyi-v-panirovke/",
			ingredients: [
				"flour",
				"oil",
				"cheese",
				"eggs",
				"bread crumbs"
			]
		},
		{
			name: "Sabajon",
			link: "https://prostokvashino.ru/recipes/syr-zharenyi-v-panirovke/",
			ingredients: [
				"sugar",
				"vine",
				"eggs",
				"apples",
				"grapes"
			]
		},
		{
			name: "Egg Roll",
			link: "http://www.russianfood.com/recipes/recipe.php?rid=142987",
			ingredients: [
				"carrot",
				"oil",
				"salt",
				"eggs",
				"sweet pepper"
			]
		},
		{
			name: "French salad",
			link: "http://www.russianfood.com/recipes/recipe.php?rid=128572",
			ingredients: [
				"carrot",
				"apple",
				"cheese",
				"eggs",
				"sour-cream"
			]
		},
		{
			name: "Pancakes with banana",
			link: "",
			ingredients: [
				"cottage-cheese",
				"oil",
				"banana",
				"eggs",
				"flour",
				"sugar"
			]
		},
		{
			name: "Potatoes pie with tomatoes and cheese",
			link: "http://www.russianfood.com/recipes/recipe.php?rid=136377",
			ingredients: [
				"potatoes",
				"salt",
				"eggs",
				"meat",
				"tomatoes",
				"cheese"
			]
	}
  ]

receipts.each do |r|
  recipt = Recipt.find_or_create_by({name: r[:name], link: r[:link]})
  recipt.ingredients << r[:ingredients].map { |i| Ingredient.find_or_create_by({name: i}) }
end
