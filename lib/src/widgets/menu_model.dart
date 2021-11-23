import 'package:flutter/material.dart';

class Menu {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function(BuildContext context) onTap;


  const Menu({
    this.title,
    this.icon,
    this.iconColor = Colors.grey,
    this.onTap,
  });
}


class MenuViewModel {
  MenuViewModel();


  List<Menu> get items => <Menu>[
    Menu(
      title: 'Profile',
      icon: Icons.person,
      iconColor: Colors.indigo,
      onTap: (context) {
        //Navigator.pushNamed(context, AppRoute.infoRoute);
      },
    ),
    Menu(
      title: 'Compare',
      icon: Icons.shuffle,
      iconColor: Colors.indigo,
      onTap: (context) {
        //Navigator.pushNamed(context, AppRoute.loginRoute);
      },
    ),
    Menu(
      title: 'AppAccommodation',
      icon: Icons.apartment_outlined,
      iconColor: Colors.indigo,
      onTap: (context) {
        //Navigator.pushNamed(context, Constant.mapRoute);
      },
    ),

  ];
}