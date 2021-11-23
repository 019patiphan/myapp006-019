import 'package:flutter/material.dart';
import 'package:miniproject/src/widgets/menu_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPage extends StatefulWidget {

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('warinthon'),
              accountEmail: Text('624235048@parichat.skru.ac.th'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/warinn.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
            ),
            ...MenuViewModel()
                .items
                .map((e) => ListTile(
              leading: Icon(
                e.icon,
                color: e.iconColor,
              ),
              title: Text(e.title),
              onTap: () {
                e.onTap(context);
              },
            ))
                .toList(),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.pinkAccent,
              ),
              title: const Text('Logout'),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                //prefs.remove(AppSetting.userNameSetting);
               // prefs.remove(AppSetting.passwordSetting);
                //Navigator.pushNamed(context, AppRoute.loginRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
