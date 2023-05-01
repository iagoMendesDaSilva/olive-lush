class Ingredient{
  final String ingredient;

  Ingredient({
    required this.ingredient,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {

    return Ingredient(
      ingredient: json['strIngredient1'],
    );
  }
}