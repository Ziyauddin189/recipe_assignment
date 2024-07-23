import 'package:dio/dio.dart';
import '../models/recipe.dart';

class RecipeService {
  final String _baseUrl =
      'https://fls8oe8xp7.execute-api.ap-south-1.amazonaws.com/dev/nosh-assignment';

  Future<List<Recipe>> fetchRecipes() async {
    try {
      final response = await Dio().get(_baseUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((recipe) => Recipe.fromJson(recipe)).toList();
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      throw Exception('Failed to load recipes: $e');
    }
  }
}
