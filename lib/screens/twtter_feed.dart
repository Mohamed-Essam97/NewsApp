import 'package:flutter/material.dart';
import 'package:map/share_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter Feed"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return Card(
            child: Column(
              children: <Widget>[_cardHeader(), _cardBoody(), _cardFooter()],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/images/bg1.png'),
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Christina Meyers'),
                Text(' @ch_meyers'),
              ],
            ),
            SizedBox(height: 8,),
            Text('Fri, 12 May 2017 - 14.30')
          ],
        ),
      ],
    );
  }

  Widget _cardBoody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 8),
      child: Text('We also taik about the future of work as the robots advance, and we ask whether a retro phone'),
    );
  }

  Widget _cardFooter() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.repeat),color: Colors.orange ,onPressed: (){

              }),
              Text('25'),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(onPressed: (){}, child: Text('SHARE',style: TextStyle(color: Colors.orange),)),
              FlatButton(onPressed: (){}, child: Text('OPEN',style: TextStyle(color: Colors.orange),)),

            ],
          ),
        ],
      ),
    );
  }
}
