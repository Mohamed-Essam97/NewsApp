import 'package:flutter/material.dart';
import 'package:map/models/nav_menu.dart';
import 'package:map/screens/home_screen.dart';
import 'package:map/screens/headline_news.dart';
import 'package:map/screens/twtter_feed.dart';


class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {


  List<NavMenuItem> navigationMenu =
  [
    NavMenuItem("Explore", () => HomeScreen()),
    NavMenuItem("Headline News", () => HeadLineNews()),
    NavMenuItem("Twitter Feed", () => TwitterFeed() ),


  ];



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 75, left: 32),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  navigationMenu[position].title,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 22),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return navigationMenu[position].destination();
                  }));


                },
              ),
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
