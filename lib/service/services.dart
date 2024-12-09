import 'dart:convert';
import 'dart:io';

import 'package:food_app/model/models.dart';
import 'package:http/http.dart' as http;

part 'food_services.dart';
part 'transaction_services.dart';
part 'user_services.dart';

String baseURL = 'https://food.rtid73.com/api';

abstract class ApiServices {
  static headersGet({String? token}) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token ?? Users.token}',
    };
  }

  static headersPost({String? token}) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token ?? Users.token}',
    };
  }

  static Future<dynamic> get(String url) async {
    Uri uri = Uri.parse(url);
    var response = await http.get(uri, headers: headersGet());

    if (response.statusCode != 200) {
      throw Exception("Failed To Get URL");
    }

    return response;
  }

  static Future<dynamic> post(String url, {dynamic body}) async {
    Uri uri = Uri.parse(url);

    var response = await http.post(uri, headers: headersPost(), body: body);

    if (response.statusCode != 200) {
      throw Exception("Failed To Post");
    }

    return response;
  }
}