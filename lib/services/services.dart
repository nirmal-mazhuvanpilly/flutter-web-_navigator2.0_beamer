import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/models/contacts.dart';
import 'package:http/http.dart' as http;

class Services {
  final String url = "http://www.mocky.io/v2/5d565297300000680030a986";
  Future<List<Contacts>?> getContactsList() async {
    http.Response response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((e) => Contacts.fromJson(e)).toList();
      } else {
        throw "Failed to load data";
      }
    } catch (e) {
      debugPrint("Error : $e");
    }
    return null;
  }
}
