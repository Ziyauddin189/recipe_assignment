import 'package:flutter/material.dart';
import 'package:nosh_assignment/view_models/recipe_view_model.dart';
import 'package:stacked/stacked.dart';


class RecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipeViewModel>.reactive(
      viewModelBuilder: () => RecipeViewModel(),
      onModelReady: (viewModel) => viewModel.fetchRecipes(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Recipes'),
          ),
          body: viewModel.isBusy
              ? Center(child: CircularProgressIndicator())
              : viewModel.errorMessage.isNotEmpty
              ? Center(child: Text(viewModel.errorMessage))
              : ListView.builder(
            itemCount: viewModel.recipes.length,
            itemBuilder: (context, index) {
              final recipe = viewModel.recipes[index];
              return ListTile(
                leading: Image.network(recipe.imageUrl),
                title: Text(recipe.dishName),
                subtitle: Text('Published: ${recipe.isPublished ? "Yes" : "No"}'),
              );
            },
          ),
        );
      },
    );
  }
}