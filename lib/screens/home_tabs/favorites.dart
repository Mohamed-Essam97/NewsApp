import 'dart:math';

import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {


  List<Color> colorsList =
  [
    Colors.red,
    Colors.teal,
    Colors.lightGreen,
    Colors.indigo,
    Colors.brown,
    Colors.purple,
  ];


  Random random = Random();

  Color _getRandomColor()
  {

    return colorsList[random.nextInt(colorsList.length)];

  }





  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context ,Position){
           return Card(
             child: Padding(
               padding: const EdgeInsets.all(16),
               child: Container(
                 child: Column(
                   children: <Widget>[
                     _autherRow(),
                     SizedBox(height: 16,),
                     _newsItemRow(),
                   ],
                 ),
               ),
             ),
           );


    },
    itemCount: 20,
    );
  }


  Widget _autherRow()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    image:DecorationImage(image: ExactAssetImage('assets/images/home.png'),
                    fit: BoxFit.cover,
                    ),
                  shape: BoxShape.circle,
                ),
              width: 50,
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left:12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Mohamed Essam",style: TextStyle(color: Colors.grey),),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Row(
                      children: <Widget>[
                        Text('15 Min .',style: TextStyle(color: Colors.grey),),
                        Text('Life Style',style: TextStyle(color: _getRandomColor()),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        IconButton(icon: Icon(Icons.bookmark_border,color: Colors.grey,), onPressed: (){})
      ],
    );

  }

  Widget _newsItemRow()
  {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: ExactAssetImage('assets/images/bg.png'),fit: BoxFit.cover),
          ),
          width: 124,
          height: 100,
          margin: EdgeInsets.only(right: 16),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text('Tech Tent: Old Phone and safe social',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 8,),
              Text('We also talk about the future of work as the robots advance, and work form home. ',style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                height: 1,
              ),),
            ],
          ),
        ),
      ],

    );

  }








}
