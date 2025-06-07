import 'dart:convert';

import 'package:bloc_practice/model/postsListModel.dart';
import 'package:http/http.dart' as http;

class DatalistRepo {
  Future<List<PostsListsModel>> fetchList() async {
    print("hitting");
    var url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(Uri.parse(url),
    headers: {
    'Accept': 'application/json',
    'User-Agent': 'FlutterApp',
  },
    );
    
    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body);
      return jsonList.map((json) => PostsListsModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
   
  }
  
}
