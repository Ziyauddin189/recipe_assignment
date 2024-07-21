import 'package:stacked/stacked.dart';
import '../models/recipe.dart';
import '../services/recipe_service.dart';

class RecipeViewModel extends BaseViewModel {
  final RecipeService _recipeService = RecipeService();
  List<Recipe> _recipes = [];
  String _errorMessage = '';

  List<Recipe> get recipes => _recipes;
  String get errorMessage => _errorMessage;

  Future<void> fetchRecipes() async {
    setBusy(true);
    try {
      _recipes = await _recipeService.fetchRecipes();
    } catch (e) {
      _errorMessage = e.toString();
    }
    setBusy(false);
  }
}