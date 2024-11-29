import 'dart:convert';

import 'package:my_project/carstat/logic/models/user.dart';
import 'package:my_project/carstat/logic/services/authentication/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthService {
  Future<String?> register(String name, String email, String password);
  Future<void> logout();
  Future<bool> login(String email, String password);
}

class AuthService implements IAuthService {
  final IUserService _userStorageService = UserService();

  @override
  Future<String?> register(String name, String email, String password) async {
    if (!email.contains('@') || name.isEmpty) {
      return 'Invalid input';
    }
    final existingUser = await _userStorageService.getUser(email);
    if (existingUser != null) {
      return 'User already exists';
    }
    final newUser = User(name: name, email: email, password: password);
    await _userStorageService.saveUser(newUser);
    return null;
  }

  @override
  Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(email);
    if (userString != null) {
      final userMap = jsonDecode(userString) as Map<String, dynamic>;
      if (password == userMap['password']) {
        await prefs.setString('currentUser', email);
        return true;
      }
    }
    return false;
  }
  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('currentUser');
  }
}
