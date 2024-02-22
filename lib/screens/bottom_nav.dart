// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:customerapp/constants/app_theme.dart';
import 'package:customerapp/screens/home_screen.dart';
import 'package:customerapp/screens/orderlist_screen.dart';
import 'package:customerapp/screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

// ignore: must_be_immutable
class BottomNav extends StatefulWidget {
  int position;
  BottomNav({
    Key? key,
    required this.position,
  }) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

final List<Widget> pages = [
  const HomeScreen(),
  const OrderListScreen(),
];

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(Settings());
          },
          icon: Icon(
            Icons.menu,
            color: AppColors.black,
          ),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "HAYA",
          style: TextStyle(color: AppColors.black),
        ),
      ),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.ltr,
        child: BottomNavigationBar(
          selectedItemColor: CupertinoColors.label,
          unselectedItemColor: CupertinoColors.systemGrey,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.position,
          onTap: (index) {
            setState(() {
              widget.position = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.home),
                label: 'Home',
                activeIcon: Icon(IconlyBold.home)),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.time_circle),
              activeIcon: Icon(IconlyBold.time_circle),
              label: 'Ordelist',
            ),
          ],
        ),
      ),
      body: pages[widget.position],
    );
  }
}
