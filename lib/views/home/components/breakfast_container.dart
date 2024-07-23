import 'package:flutter/material.dart';
import 'package:nosh_assignment/generated/l10n.dart';
import 'package:nosh_assignment/view_models/recipe_view_model.dart';
import 'package:nosh_assignment/widgets/rounded_grey_container.dart';
import 'package:stacked/stacked.dart';

class BreakfastContainer extends StatelessWidget {
  const BreakfastContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipeViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.fetchRecipes(),
      viewModelBuilder: () => RecipeViewModel(),
      builder: (context, viewModel, child) {
        return viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : viewModel.errorMessage.isNotEmpty
                ? Center(child: Text(viewModel.errorMessage))
                : Container(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                          child: Text(
                            LanguageTranslation.current.breakfasts_for_champions,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Container(
                            height: 300,
                            margin: const EdgeInsets.only(bottom: 15),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              reverse: true,
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
                    ),
                  );
      },
    );
  }
}
