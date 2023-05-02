class Api {
  static const String BASE_URL = "https://www.thecocktaildb.com/api/json/v1/1/";
  static const String SEARCH_URL = BASE_URL + "search.php?s=";
  static const String RANDOM_DRINK_URL = BASE_URL + "random.php";
  static const String INGREDIENTS_URL = BASE_URL + "list.php?i=list";
  static const String DRINKS_BY_INGREDIENT_URL = BASE_URL + "filter.php?i=";
  static const String DRINKS_BY_ID_URL = BASE_URL + "lookup.php?i=";
  static const String INITIAL_SEARCH_URL = SEARCH_URL + "martini";
}
