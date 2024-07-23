import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nosh_assignment/generated/l10n.dart';
import 'package:nosh_assignment/views/home/home.dart';

List<TabItem> items = [
  TabItem(
    icon: Icons.dinner_dining,
    title: LanguageTranslation.current.recipes,
  ),
  TabItem(
    icon: Icons.list_outlined,
    title: LanguageTranslation.current.list,
  ),
  TabItem(
    icon: Icons.local_fire_department,
    title: LanguageTranslation.current.nosh,
  ),
  TabItem(
    icon: Icons.event,
    title: LanguageTranslation.current.meal_plan,
  ),
  TabItem(
    icon: Icons.person,
    title: LanguageTranslation.current.profile,
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
        title: Center(
            child: Text(
          LanguageTranslation.current.recipes,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        )),
        backgroundColor: Colors.white70,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.favorite_border,
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
              children: [
                const Icon(
                  Icons.signal_wifi_off,
                  size: 100,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                Text(
                  LanguageTranslation.current.oops_no_internet,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                Text(
                  LanguageTranslation.current.please_check_your_internet,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                Text(
                  LanguageTranslation.current.pull_down_to_refresh,
                  style: const TextStyle(
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
        backgroundColor: Colors.white,
        //withOpacity(0.21),
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
