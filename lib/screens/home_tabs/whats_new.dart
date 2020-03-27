import 'package:flutter/material.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );
    TextStyle _headerDescription = TextStyle(
      color: Colors.white,
      fontSize: 18,
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage('assets/images/home.png'),
            fit: BoxFit.cover),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 48, left: 48),
            child: Text(
              'Wraps NSUserDefaults and SharedPreferences, persisted to disk asynchronously',
              style: _headerTitle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 34, left: 34),
            child: Text(
              'SharedPreferences, providing a persistent store for simple data',
              style: _headerDescription,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      )),
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: _drawSectionTitle('Top Stories'),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: Column(
                children: <Widget>[
                  _drawSingleRow(),
                  _drawDivider(),
                  _drawSingleRow(),
                  _drawDivider(),
                  _drawSingleRow(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 8, top: 8),
                  child: _drawSectionTitle('Recent Updates'),
                ),
                _drawRecentUpdatesCard(Colors.deepOrange),
                _drawRecentUpdatesCard(Colors.deepPurpleAccent),
                SizedBox(
                  height: 48,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drawSingleRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          SizedBox(
            child: Image(
              image: ExactAssetImage('assets/images/bg2.jpg'),
              fit: BoxFit.cover,
            ),
            width: 125,
            height: 125,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  'The World Global Waring Annual Summit ',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Michael Adams'),
                    SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.timer),
                        Text('15 min'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawRecentUpdatesCard(Color color) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/bg1.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
            ),
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 2, bottom: 2),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'SPORT',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Text(
              'Vettel is Ferrari Number One - Hamilton',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.timer,
                  color: Colors.grey,
                  size: 14,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '15 min',
                  style: TextStyle(color: Colors.grey,fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade100,
    );
  }

  Widget _drawSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.grey.shade600,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
    );
  }
}
