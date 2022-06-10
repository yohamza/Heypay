import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:heypay/utils/color_manager.dart';
import 'package:heypay/utils/iconly/iconly_bold.dart';
import 'package:heypay/utils/styles.dart';
import 'package:heypay/views/home.dart';
import 'package:heypay/views/profile.dart';
import 'package:heypay/views/stats.dart';
import 'package:heypay/views/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Wallet(),
    const Stats(),
    const Profile()
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorManager.bgColor(context),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle:
            TextStyle(fontSize: 20.0, color: Styles.primaryColor),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.selectedItemColor(context),
        unselectedItemColor: Colors.grey.withOpacity(0.7),
        items: const [
          BottomNavigationBarItem(icon: Icon(IconlyBold.Home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(IconlyBold.Wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(IconlyBold.Chart), label: 'Stats'),
          BottomNavigationBarItem(
              icon: Icon(IconlyBold.Profile), label: 'Profile')
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
