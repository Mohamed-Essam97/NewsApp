import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:map/share_ui/navigation_drawer.dart';
import 'package:map/screens/home_tabs/whats_new.dart';
import 'package:map/screens/home_tabs/popular.dart';
import 'package:map/screens/home_tabs/favorites.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{


  TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0,length: 3, vsync: this);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: " WHAT'S NEW ",
            ),
            Tab(
              text: " POPULAR ",
            ),
            Tab(
              text: " FAVORITES ",
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(children: [
          WhatsNew(),
          Popular(),
          Favorites(),
        ],
          controller: _tabController,
        ),
      ),
    );
  }
}
