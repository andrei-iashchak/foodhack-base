ingridients = [
	{
	  id: 1,
	  name: "tomato"
	}, {
	  id: 2,
	  name: "egg"
	}, {
	  id: 3,
	  name: "egg_box"
	}, {
	  id: 4,
	  name: "sweet_pepper"
	}, {
	  id: 5,
	  name: "milk"
	}, {
	  id: 6,
	  name: "cheese"
	}, {
	  id: 7,
	  name: "butter"
	}, {
	  id: 8,
	  name: "strawberry"
	}, {
	  id: 9,
	  name: "wine"
	}, {
	  id: 10,
	  name: "beer"
	}, {
	  id: 11,
	  name: "grape"
	}, {
	  id: 12,
	  name: "carrot"
	}, {
	  id: 13,
	  name: "condensed_milk"
	}, {
	  id: 14,
	  name: "banan"
	}, {
	  id: 15,
	  name: "pepper"
	}, {
	  id: 16,
	  name: "lemon"
	}, {
	  id: 17,
	  name: "sauce"
	}, {
	  id: 18,
	  name: "soy_sauce"
	}, {
	  id: 19,
	  name: "sour_cream"
	}
]
Ingredient.create(ingridients)

receipts = [
	{
		name: "Фруктовый салат",
		link: "https://www.patee.ru/recipes/desserts/view/?id=1021364",
		ingredients: [
			"grape",
			"banana",
			"apple",
			"sugar",
			"sour_cream"
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
		link: "https://webspoon.ru/receipt/salat_iz_pomidorov_i_perca_so_smetanojj",
		ingredients: [
			"garlic",
			"tomato",
			"sweet_pepper",
			"sour_cream",
			"salt"
		]
	},
	{
			name: "Сырные шарики",
			link: "https://eda.ru/recepty/zakuski/sirnie_shariki_na_skovorode_40671",
			ingredients: [
				"cheese",
				"flour",
				"egg",
				"salt"
			]
		},
		{
			name: "Перец и сыр",
			link: "https://gotovim_doma.ru/recipe/667_zakuska_iz_pertsa_s_syrom_svetofor",
			ingredients: [
				"garlic",
				"cheese",
				"sweet_pepper",
				"sour_cream",
				"salt"
			]
		},
		{
			name: "Лимонад",
			link: "https://www.passion.ru/food/sostavlyaem_menyu/domashniy_limonad_10_luchshih_receptov_78028.htm",
			ingredients: [
				"lemon",
				"water",
				"sugar"
			]
		},
		{
			name: "Салат с морковью и сыром",
			link: "http://pojrem.ru/salad/s_morkovju_syrom_i_chesnokom/",
			ingredients: [
				"garlic",
				"carrot",
				"cheese",
				"sour_cream",
				"salt"
			]
		},
		{
			name: "Жареный сыр",
			link: "https://prostokvashino.ru/recipes/syr_zharenyi_v_panirovke/",
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
			link: "https://prostokvashino.ru/recipes/syr_zharenyi_v_panirovke/",
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
				"sweet_pepper"
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
				"sour_cream"
			]
		},
		{
			name: "Кексы с бананами",
			link: "",
			ingredients: [
				"cottage_cheese",
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
