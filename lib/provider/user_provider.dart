import 'package:flutter/material.dart';
import 'package:flutter_starter/model/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  Future<void> fetchUser() async {
    // fetch user data from server and update _user
    _user = User(
        name: 'John Doe',
        email: 'john.doe@example.com',
        phone: '123-456-7890',
        address: '123 Main St',
        city: 'Anytown',
        state: 'CA',
        zip: '12345');
    notifyListeners();
  }

  Future<void> updateUser(User user) async {
    // update user data on server and update _user
    _user = user;
    notifyListeners();
  }
}
