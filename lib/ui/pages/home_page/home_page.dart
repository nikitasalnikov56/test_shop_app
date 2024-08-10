import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/ui/components/favorite_screen.dart';
import 'package:shop_app/ui/components/home_screen.dart';
import 'package:shop_app/ui/components/profile_screen.dart';
import 'package:shop_app/ui/style/app_style.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int curIndex = 0;

  _onChangedIndex(int value) {
    setState(() {
      curIndex = value;
    });
  }

  List<Widget> screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  List<String> title = [
    'Товары',
    'Избранное',
    'Профиль',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          title[curIndex],
          style: AppStyle.fontStyle.copyWith(fontSize: 25),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curIndex,
        onTap: (value) => _onChangedIndex(value),
        selectedItemColor: Colors.purple,
        selectedLabelStyle: AppStyle.fontStyle.copyWith(
          color: Colors.purple,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Profile',
          ),
        ],
      ),
      body: screens[curIndex],
    );
  }
}
