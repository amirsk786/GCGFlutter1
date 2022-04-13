import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/user.dart';

class getData {
  var name;
  Future<List<User>> fetchUsers(url) async {
    var response = await Dio().get(url);
    if (response.statusCode == 200) {
      var getUsersData = response.data as List;
      var listUsers = getUsersData.map((i) {
        return User.fromJson(i);
      }).toList();
      return listUsers;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
