import 'package:flutter/material.dart';
import 'package:map/pagemodel.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:map/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<PageModel> pages;

  ValueNotifier<int> _PageViewNotifier = ValueNotifier(0);

/*
  List<String> images = [
    'assets/images/bg.png',
    'assets/images/bg1.png',
    'assets/images/bg2.jpg',
    'assets/images/bg3.jpg',
  ];

  List<IconData> icons = [
    Icons.ac_unit,
    Icons.camera,
    Icons.favorite,
    Icons.account_balance,
  ];

  List<String> titles = [
    'Welcome',
    'Camera',
    'Favorite',
    'Balance',
  ];

  List<String> descriptions = [
    '1 = Making Friends is easy waving your hand back and forth in easy step ',
    '2 = Making Friends is easy waving your hand back and forth in easy step ',
    '3 = Making Friends is easy waving your hand back and forth in easy step ',
    '4 = Making Friends is easy waving your hand back and forth in easy step ',
  ];
*/

  void _addPages()
  {
    pages = List<PageModel>();
    pages.add(PageModel(
      'Welcome',
      '1 = Making Friends is easy waving your hand back and forth in easy step ',
      Icons.ac_unit,
      'assets/images/bg.png',
    ));
    pages.add(PageModel(
      'Camera',
      '2 = Making Friends is easy waving your hand back and forth in easy step ',
      Icons.camera,
      'assets/images/bg1.png',
    ));
    pages.add(PageModel(
      'Favorite',
      '3 = Making Friends is easy waving your hand back and forth in easy step ',
      Icons.favorite,
      'assets/images/bg2.jpg',
    ));
    pages.add(PageModel(
      'Balance',
      '4 = Making Friends is easy waving your hand back and forth in easy step ',
      Icons.account_balance,
      'assets/images/bg3.jpg',
    ));

  }


  int currentIndex = 0;





  @override
  Widget build(BuildContext context) {

      _addPages();
      
    return  Stack(
        children: <Widget>[
          Scaffold(
            body: PageView.builder(
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage(
                                pages[index].image
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Transform.translate(
                          child: Icon(
                            pages[index].icons,
                            size: 150.0,
                            color: Colors.white,
                          ),
                          offset: Offset(0, -100),
                        ),
                        Text(
                          pages[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 48, right: 48, top: 18),
                          child: Text(
                            pages[index].description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
              itemCount: pages.length, //عدد الصفحات
              onPageChanged:(index){
                _PageViewNotifier.value = index;
              },
            ),
          ),
          Transform.translate(
            offset: Offset(0, 175 ),
            child: Align(
              alignment: Alignment.center,
              child: _drawCircle(pages.length),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0, right: 16, left: 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  color: Colors.red.shade900,
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: 1),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {

                            _updateSeen();
                            //TODO: Update Seen
                            return HomeScreen();
                          },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
    );
    }

  /*List<Widget> _drawPageIndicator ()
  {
    List<Widget> _widget = List<Widget>();
    for( int i =0 ; i<pages.length; i++ )
    {
      _widget.add(_drawCircle(Colors.red));
    }
    return _widget;
  }
*/

  Widget _drawCircle(int length)
  {
    return PageViewIndicator(
      pageIndexNotifier: _PageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }

  void _updateSeen() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}



