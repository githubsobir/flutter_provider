import 'dart:convert';

import 'package:flutter_provider/models/user_model.dart';
import 'package:http/http.dart';



class HttpServices {
  static final String baseUrl = "jsonplaceholder.typicode.com";
  static final String url1 = "/posts";
  static final Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8'
  };

  static Future<List<UserModels>> getData1({String urls1}) async {
    try {
      var url = Uri.https(baseUrl, urls1);
      var response = await get(url, headers: headers);
      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List)
            .map((e) => UserModels.fromJson(e))
            .toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<String> changeData1({String changeItem}) async {
    try {
      var url = Uri.https(baseUrl, url1 + "/$changeItem", emptyParams());
      var response = await delete(url, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return "1";
      }
    } catch (e) {
      print(e);
      return "0";
    }
    return "-1";
  }

  static Future<String> upData({String id, Map<String, dynamic> params}) async {
    try {
      var url = Uri.https(baseUrl, url1+"/$id");
      print(jsonEncode(params.toString()));
      var response = await put(url, headers: headers, body: jsonEncode(params));



      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
      return "2";
    } catch (e) {
      print(e);
      return "1";
    }
  }
  static Future<String> createData({ Map<String, dynamic> params}) async {
    try {
      var url = Uri.https(baseUrl, url1);
      print(jsonEncode(params.toString()));
      var response = await post(url, headers: headers, body: jsonEncode(params));



      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
      return "2";
    } catch (e) {
      print(e);
      return "1";
    }
  }

  static Map<String, dynamic> emptyParams() {
    Map<String, dynamic> maps = {"": ""};
    return maps;
  }


}
