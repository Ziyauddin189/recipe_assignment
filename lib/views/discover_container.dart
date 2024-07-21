import 'package:flutter/material.dart';
import 'package:nosh_assignment/view_models/recipe_view_model.dart';
import 'package:stacked/stacked.dart';

class DiscoverContainer extends StatelessWidget {
  const DiscoverContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipeViewModel>.reactive(

      onModelReady: (viewModel) => viewModel.fetchRecipes(),
      viewModelBuilder: () => RecipeViewModel(),
      builder: (context, viewModel, child) {
        return viewModel.isBusy
            ? Center(child: CircularProgressIndicator())
            : viewModel.errorMessage.isNotEmpty
            ? Center(child: Text(viewModel.errorMessage))
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Discover regional delights',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 500,
                  child: ListView.builder(
          scrollDirection: Axis.horizontal, // Set horizontal scroll direction
          itemCount: viewModel.recipes.length,
          itemBuilder: (context, index) {
                  final recipe = viewModel.recipes[index];
                  return Container(
                    width: 200, // Set a width for each item to properly display in horizontal scroll
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(recipe.imageUrl),
                        SizedBox(height: 8.0),
                        Text(
                          recipe.dishName,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
                ),
              ],
            );
      },
    );
  }
}
