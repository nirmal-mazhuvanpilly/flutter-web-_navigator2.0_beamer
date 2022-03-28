import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/models/contacts.dart';
import 'package:flutter_web_app_navigation/services/services.dart';

class ContactsProvider with ChangeNotifier {
  final Services _services = Services();

  List<Contacts>? _contactList;

  List<Contacts>? get contactList => _contactList;

  set contactList(List<Contacts>? list) {
    _contactList = list;
    notifyListeners();
  }

  Future<void> getContacts() async {
    contactList = await _services.getContactsList();
  }
}
