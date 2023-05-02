class DrinkByIngredient{
  final String id;
  final String name;
  final String drinkThumb;

  DrinkByIngredient({
    required this.id,
    required this.name,
    required this.drinkThumb,
  });

  factory DrinkByIngredient.fromJson(Map<String, dynamic> json) {

    return DrinkByIngredient(
      id: json['idDrink'],
      name: json['strDrink'],
      drinkThumb: json['strDrinkThumb'],
    );
  }
}