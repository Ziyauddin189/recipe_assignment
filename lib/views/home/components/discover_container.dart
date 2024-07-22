import 'package:flutter/material.dart';
import 'package:nosh_assignment/view_models/recipe_view_model.dart';
import 'package:nosh_assignment/widgets/rounded_grey_container.dart';
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                  child: Text('Discover regional delights',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SizedBox(
                    height: 300,
                    child: ListView.builder(
          scrollDirection: Axis.horizontal,
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
