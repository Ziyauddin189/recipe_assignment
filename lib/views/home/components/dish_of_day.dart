import 'package:flutter/material.dart';
import 'package:nosh_assignment/view_models/recipe_view_model.dart';
import 'package:stacked/stacked.dart';

class DealOfDay extends StatelessWidget {
  const DealOfDay({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipeViewModel>.reactive(
      onModelReady: (viewModel) => viewModel.fetchRecipes(),
      viewModelBuilder: () => RecipeViewModel(),
      builder: (context, viewModel, child) {
        bool hasRecipes = viewModel.recipes.isNotEmpty;
        return Stack(
          children: [
            hasRecipes
                ? Image.network(viewModel.recipes[3].imageUrl)
                : Center(child: CircularProgressIndicator()),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    'Dish of the day',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    hasRecipes ? 'Chicken Biryani' : '',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
