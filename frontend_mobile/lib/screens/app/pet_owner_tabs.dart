// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/app/home.dart';
import 'package:frontend_mobile/screens/app/profile.dart';
import 'package:frontend_mobile/screens/app/chats.dart';
import 'package:frontend_mobile/screens/app/favorites.dart';
import 'package:frontend_mobile/screens/app/notification.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:frontend_mobile/widgets/app_bar.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});
  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;
  String title = 'Home';
  final pages = [
    const Home(),
    const Favorites(),
    const Chats(),
    const Notifications(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        {
          setState(() {
            title = 'Home';
          });
        }
        break;

      case 1:
        {
          setState(() {
            title = 'Favorites';
          });
        }
        break;
      case 2:
        {
          setState(() {
            title = 'Chats';
          });
        }
        break;

      case 3:
        {
          setState(() {
            title = 'Notifications';
          });
        }
        break;

      case 4:
        {
          setState(() {
            title = 'Profile';
          });
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: title,
          appBar: AppBar(),
          showBack: false,
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Theme.of(context).primaryColor,
          initialActiveIndex: _selectedIndex,
          style: TabStyle.reactCircle,
          items: const [
            TabItem(
              icon: Icons.home,
              title: '',
            ),
            TabItem(
              icon: Icons.favorite,
              title: '',
            ),
            TabItem(
              icon: Icons.chat_bubble,
              title: '',
            ),
            TabItem(
              icon: Icons.notifications,
              title: '',
            ),
            TabItem(
              icon: Icons.person,
              title: '',
            ),
          ],
          onTap: _onItemTapped,
        ),
        body: Container(
          child: pages[_selectedIndex],
        ));
  }
}
