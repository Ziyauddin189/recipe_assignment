import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:nosh_assignment/view_models/recipe_view_model.dart';
import 'package:nosh_assignment/views/breakfast_container.dart';
import 'package:nosh_assignment/views/discover_container.dart';
import 'package:nosh_assignment/views/dish_of_day.dart';
import 'package:nosh_assignment/views/item_container.dart';
import 'package:stacked/stacked.dart';

const List<TabItem> items = [
  TabItem(
    icon: Icons.home,
    title: 'Recipes',
  ),
  TabItem(
    icon: Icons.calendar_month,
    title: 'List',
  ),
  TabItem(
    icon: Icons.library_books,
    title: 'Nosh',
  ),
  TabItem(
    icon: Icons.event,
    title: 'Meal Plan',
  ),
  TabItem(
    icon: Icons.account_box,
    title: 'Profile',
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int visit = 0;
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
                BreakfastContainer(),
                ItemContainer()
              ],
            ),
          ),
          bottomNavigationBar: BottomBarInspiredFancy(
            items: items,
            backgroundColor: Colors.white, //withOpacity(0.21),
            color: Colors.grey,
            colorSelected: Colors.deepOrangeAccent,
            indexSelected: visit,
            styleIconFooter: StyleIconFooter.dot,
            onTap: (int index) => setState(() {
              visit = index;
              if (index == 1) {
                //
              }
              if (index == 2) {
                //
              }
            }),
          ),
        );
      },
    );
  }
}

