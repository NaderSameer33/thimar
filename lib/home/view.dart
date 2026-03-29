import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import '../core/ui/app_image.dart';
import 'pages/account/view.dart';
import 'pages/favourite/view.dart';
import 'pages/home/view.dart';
import 'pages/notifaction/view.dart';
import 'pages/order.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final list = [
    Modle(image: 'orders.svg', page: OrderPage()),
    Modle(image: 'notifications.svg', page: NotificationsPage()),
    Modle(image: 'home.svg', page: HomePage()),
    Modle(image: 'favourite.svg', page: FavouritePage()),
    Modle(image: 'account.svg', page: AccountPage()),
  ];
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex].page,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xff4C8613),
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: list
            .map(
              (item) => AppImage(
                image: item.image,
                color: Colors.white,
              ),
            )
            .toList(),
      ),
    );
  }
}

class Modle {
  final String image;
  final Widget page;
  Modle({required this.image, required this.page});
}
