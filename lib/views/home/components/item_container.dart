import 'package:flutter/material.dart';
import 'package:nosh_assignment/view_models/recipe_view_model.dart';
import 'package:nosh_assignment/widgets/rounded_grey_container.dart';
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
            SizedBox(
              height: 290,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    RoundedGreyContainer(
                      imageUrl: viewModel.recipes[2].imageUrl,
                      title: viewModel.recipes[2].dishName,
                      buttonText: 'Open',
                      onButtonPressed: () {},
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 290,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    RoundedGreyContainer(
                      imageUrl: viewModel.recipes[3].imageUrl,
                      title: viewModel.recipes[3].dishName,
                      buttonText: 'Open',
                      onButtonPressed: () {},
                    ),

                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

