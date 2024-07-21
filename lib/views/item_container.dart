import 'package:flutter/material.dart';
import 'package:nosh_assignment/view_models/recipe_view_model.dart';
import 'package:nosh_assignment/views/rounded_grey_container.dart';
import 'package:stacked/stacked.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({super.key});

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
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: viewModel.recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = viewModel.recipes[index];
                    return RoundedGreyContainer(
                      imageUrl: recipe.imageUrl,
                      title: recipe.dishName,
                      buttonText: 'Open',
                      onButtonPressed: () {},
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
