import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:map/models/author.dart'; //dart to change type of data
import 'package:map/utilties/api_utilities.dart';

class AuthorsAPI
{


  Future<List<Author>> fetchAllAuthors() async {

    String allAthorsApi  =base_api + all_authors_api;

    var response = await http.get(allAthorsApi);

    if(response.statusCode==200)
    {

      var data = response.body;
      
      print(data);

    }

  }



}