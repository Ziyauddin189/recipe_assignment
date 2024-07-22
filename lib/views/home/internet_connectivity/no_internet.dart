import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nosh_assignment/views/home/home.dart';

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

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  bool _isRefreshing = false;
  int visit = 0;

  Future<void> _checkInternetAndNavigate() async {
    final result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  Future<void> _handleRefresh() async {
    setState(() {
      _isRefreshing = true;
    });
    await _checkInternetAndNavigate();
    setState(() {
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
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
      body: Center(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.signal_wifi_off,
                  size: 100,
                  color: Colors.red,
                ),
                SizedBox(height: 16),
                Text(
                  "Oops! No internet connection.",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  "Please check your internet connection.",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  "Pull down to refresh.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
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
  }
}
