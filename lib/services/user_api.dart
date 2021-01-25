import 'dart:convert';

import 'package:flutter_tutorials/models/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> getAllUser() async {
    final getUser =
        await http.get('https://jsonplaceholder.typicode.com/users');
    final List responseBody = jsonDecode(getUser.body);
    return responseBody.map((e) => User.fromJson(e)).toList();
  }
}
