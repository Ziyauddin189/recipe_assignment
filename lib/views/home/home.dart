import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:nosh_assignment/view_models/recipe_view_model.dart';
import 'package:nosh_assignment/views/home/components/breakfast_container.dart';
import 'package:nosh_assignment/views/home/components/discover_container.dart';
import 'package:nosh_assignment/views/home/components/dish_of_day.dart';
import 'package:nosh_assignment/views/home/components/item_container.dart';
import 'package:nosh_assignment/widgets/rounded_grey_container.dart';
import 'package:stacked/stacked.dart';

const List<TabItem> items = [
  TabItem(
    icon: Icons.dinner_dining,
    title: 'Recipes',
  ),
  TabItem(
    icon: Icons.list_outlined,
    title: 'List',
  ),
  TabItem(
    icon: Icons.local_fire_department,
    title: 'Nosh',
  ),
  TabItem(
    icon: Icons.event,
    title: 'Meal Plan',
  ),
  TabItem(
    icon: Icons.person,
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
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.favorite_border,
                  color: Colors.black,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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

