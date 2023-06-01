import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_api/core/models/user.dart';
import 'package:flutter_api/core/resources/environtment.dart';

class UserHttp {
  Future<List<User>> ListOfUsers() async {
    try {
      var resp = await http.get(Uri.parse(endpoint));
      if (resp.statusCode == 200) {
        List map = jsonDecode(resp.body);
        //print(map)
        List<User> users = map.map((e) => User.fromJson(e)).toList();
        return users;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future users() async {
    try {
      var resp = await http.get(Uri.parse(endpoint));
      if (resp.statusCode == 200) {
        List map = jsonDecode(resp.body);
        //print(map)
        List<User> users = map.map((e) => User.fromJson(e)).toList();
        return users;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
    }
  }

  Future addUsers(String name) async {
    try {
      var body = {"name": name};
      var resp = await http.post(Uri.parse(endpoint), body: body);
      if (resp.statusCode <= 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> addUser(String name,
      {DateTime? date, String avatar = "avatar", String id = "1"}) async {
    try {
      Map<String, dynamic> UserMap =
          User(name: name, createdAt: DateTime.now(), avatar: avatar, id: id)
              .toJson();

      var resp = await http.post(Uri.parse(endpoint), body: UserMap);
      print("resp ${resp.body}");
      if (resp.statusCode <= 201) {
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future updateUsers(String name) async {
    try {
      var body = {"name": name};
      var resp = await http.put(Uri.parse(endpoint), body: body);
      if (resp.statusCode <= 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  Future deleteUsers(String id) async {
    try {
      var resp = await http.delete(Uri.parse("${endpoint}/$id"));
      if (resp.statusCode <= 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }
}
