import 'package:ecommercesas/view/home_screen/home_screen.dart';
import 'package:ecommercesas/view/premium_screen/premiumscreen.dart';
import 'package:ecommercesas/view/tamilnadu_screen/tamilnaduscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  //  @override
  // void initState() {
  //   super.initState();
  // }
  int _selectedIntex = 0;
  @override
  Widget build(BuildContext context) {
    List screens = [
      HomeScreen(),
      PremiumScreen(),
      TamilnaduSCreen(),
    ];
    return Scaffold(
      body: screens[_selectedIntex],
      bottomNavigationBar: Container(
        // height: 70,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GNav(
              curve: Curves.ease,
              selectedIndex: 0,
              gap: 6,
              backgroundColor: Colors.white,
              color: Colors.grey,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
              onTabChange: (value) {
                setState(() {
                  _selectedIntex = value;
                });
              },
              tabs: [
                GButton(
                  icon: Icons.home,
                  // text: 'All',
                  leading: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "All",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                GButton(
                  icon: Icons.workspace_premium,
                  // text: 'Premium',
                  leading: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Premium",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey),
                    ),
                  ),
                ),
                GButton(
                  icon: Icons.ac_unit,
                  // text: 'Tamilnadu',
                  leading: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Tamilnadu",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
