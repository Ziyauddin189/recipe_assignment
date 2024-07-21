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
        return Stack(
          children: [
            Image.network(viewModel.recipes[3].imageUrl),
            Center(
              child: Column(
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
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Egg curry',
                    style: TextStyle(
                      fontSize: 12.0,
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
