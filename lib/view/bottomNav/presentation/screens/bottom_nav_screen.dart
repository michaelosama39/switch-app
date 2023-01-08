import 'package:flutter/material.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/view/activation/presentation/screens/activation_screen.dart';
import 'package:switch_app/view/profile/presentation/screens/profile_screen.dart';
import 'package:switch_app/view/setting/presentation/screens/setting_screen.dart';
import 'package:switch_app/view/setting/presentation/widgets/setting_body.dart';
import 'package:switch_app/view/store/presentation/screens/store_screen.dart';

class BottomNavScreen extends StatefulWidget {
  BottomNavScreen({Key? key , this.selectedIndex = 0}) : super(key: key);

  int selectedIndex;

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        onTap: (index) {
          setState(() {
            widget.selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplay_sharp),
            label: 'Activation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
      body: widget.selectedIndex == 0
          ? ProfileScreen()
          : widget.selectedIndex == 1
              ? StoreScreen()
              : widget.selectedIndex == 2
                  ? ActivationScreen()
                  : widget.selectedIndex == 3
                      ? SettingScreen()
                      : SizedBox(),
    );
  }
}
