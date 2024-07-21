import 'package:flutter/material.dart';
import 'package:nosh_assignment/view_models/recipe_view_model.dart';
import 'package:nosh_assignment/views/discover_container.dart';
import 'package:nosh_assignment/views/dish_of_day.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipeViewModel>.reactive(
      viewModelBuilder: () => RecipeViewModel(),
      onModelReady: (viewModel) => viewModel.fetchRecipes(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Recipes',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )),
            backgroundColor: Colors.white70,
            actions: [
              Icon(Icons.heart_broken_sharp)
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                DealOfDay(),
                DiscoverContainer(),
              ],
            ),
          ),
        );
      },
    );
  }
}

