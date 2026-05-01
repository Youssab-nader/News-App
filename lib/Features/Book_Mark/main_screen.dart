import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/Features/Book_Mark/book_mark_screen.dart';
import 'package:news_app/Features/Home/home_screen.dart';
import 'package:news_app/Features/Profile/profile_screen.dart';
import 'package:news_app/Features/Search/search_screen.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_text_styles.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    BookMarkScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTextStyles.selectedLabelStyle,
        unselectedLabelStyle: AppTextStyles.unselectedLabelStyle,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Icons/home_Icon.svg'),
            activeIcon: SvgPicture.asset('assets/Icons/active_home_Icon.svg'),
            label: 'Home',
            backgroundColor: AppColors.primary,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Icons/search_icon.svg'),
            activeIcon: SvgPicture.asset('assets/Icons/active_search_icon.svg'),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Icons/book_mark_icon.svg'),
            activeIcon: SvgPicture.asset(
              'assets/Icons/active_book_mark_icon.svg',
            ),
            label: 'Book Mark',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Icons/profile_icon.svg'),
            activeIcon: SvgPicture.asset(
              'assets/Icons/active_profile_icon.svg',
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: _screens[currentIndex],
    );
  }
}
