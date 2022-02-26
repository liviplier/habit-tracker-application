import 'package:flutter/material.dart';
import 'package:habit_tracker/app_colors.dart';
import 'package:habit_tracker/screens/main%20screens/home_screen.dart';
import 'package:habit_tracker/screens/main%20screens/overview_screen.dart';
import 'package:habit_tracker/screens/main%20screens/profile_view_screen.dart';
import 'package:habit_tracker/screens/main%20screens/search_screen.dart';
import 'package:habit_tracker/screens/widgets/theme_changer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List screensList = [
    const HomeScreen(),
    const SearchScreen(),
    const OverviewScreen(),
    const ProfileView(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? AppColors.darkMode : AppColors.lightMode,
      body: screensList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        backgroundColor: isDark ? AppColors.darkMode : AppColors.lightMode,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor:
            isDark ? AppColors.lightMode : AppColors.blackWithOpacity,
        unselectedItemColor:
            isDark ? AppColors.whiteWitOpacity : AppColors.greyWithOpacity,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.auto_graph_outlined,
            ),
            label: "Overview",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
