receipts = [
	{
		name: "Фруктовый салат",
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
		name: "Омлет",
		link: "http://www.calorizator.ru/recipe/45724",
		ingredients: [
			"cheese",
			"egg",
			"milk",
			"tomato"
		]
	},
	{
		name: "Салат с помидорами и перцем",
		link: "https://webspoon.ru/receipt/salat-iz-pomidorov-i-perca-so-smetanojj",
		ingredients: [
			"garlic",
			"tomato",
			"sweet-pepper",
			"sour-cream",
			"salt"
		]
	},
	{
			name: "Сырные шарики",
			link: "https://eda.ru/recepty/zakuski/sirnie-shariki-na-skovorode-40671",
			ingredients: [
				"cheese",
				"flour",
				"egg",
				"salt"
			]
		},
		{
			name: "Перец и сыр",
			link: "https://gotovim-doma.ru/recipe/667-zakuska-iz-pertsa-s-syrom-svetofor",
			ingredients: [
				"garlic",
				"cheese",
				"sweet-pepper",
				"sour-cream",
				"salt"
			]
		},
		{
			name: "Лимонад",
			link: "https://www.passion.ru/food/sostavlyaem-menyu/domashniy-limonad-10-luchshih-receptov-78028.htm",
			ingredients: [
				"lemon",
				"water",
				"sugar"
			]
		},
		{
			name: "Салат с морковью и сыром",
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
			name: "Жареный сыр",
			link: "https://prostokvashino.ru/recipes/syr-zharenyi-v-panirovke/",
			ingredients: [
				"flour",
				"oil",
				"cheese",
				"egg",
				"bread crumbs"
			]
		},
		{
			name: "Сабайон",
			link: "https://prostokvashino.ru/recipes/syr-zharenyi-v-panirovke/",
			ingredients: [
				"sugar",
				"vine",
				"egg",
				"apple",
				"grapes"
			]
		},
		{
			name: "Яичный рулет",
			link: "http://www.russianfood.com/recipes/recipe.php?rid=142987",
			ingredients: [
				"carrot",
				"oil",
				"salt",
				"egg",
				"sweet-pepper"
			]
		},
		{
			name: "Французский салат",
			link: "http://www.russianfood.com/recipes/recipe.php?rid=128572",
			ingredients: [
				"carrot",
				"apple",
				"cheese",
				"egg",
				"sour-cream"
			]
		},
		{
			name: "Кексы с бананами",
			link: "",
			ingredients: [
				"cottage-cheese",
				"oil",
				"banana",
				"egg",
				"flour",
				"sugar"
			]
		},
		{
			name: "Картофельный пирог с сыром и томатами",
			link: "http://www.russianfood.com/recipes/recipe.php?rid=136377",
			ingredients: [
				"potato",
				"salt",
				"egg",
				"meat",
				"tomato",
				"cheese"
			]
	}
]

receipts.each do |r|
  recipt = Recipt.find_or_create_by({name: r[:name], link: r[:link]})
  recipt.ingredients << r[:ingredients].map { |i| Ingredient.find_or_create_by({name: i}) }
end
