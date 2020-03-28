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


enum PopOutMenu
{
  HELP,ABOUT,CONTACT,SETTINGS
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
          _popOutMenu(context),
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

  Widget _popOutMenu(BuildContext context)
  {
    return PopupMenuButton<PopOutMenu>(itemBuilder: (context){
        return [
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.ABOUT,
            child: Text('ABOUT'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.CONTACT,
            child: Text('CONTACT'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.HELP,
            child: Text('HELP'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.SETTINGS,
            child: Text('SETTINGS'),
          ),
        ];
    },
    onSelected: (PopOutMenu menu){
      //TODO :

    },
      icon: Icon(Icons.more_vert),
    );
  }
}
