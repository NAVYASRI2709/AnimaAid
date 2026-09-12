import 'package:flutter/foundation.dart';

enum UserRole {
  user,
  admin,
}

class AuthSessionService {
  AuthSessionService._();

  static final AuthSessionService instance = AuthSessionService._();

  final ValueNotifier<UserRole?> role = ValueNotifier<UserRole?>(null);

  bool get isLoggedIn => role.value != null;

  bool get isAdmin => role.value == UserRole.admin;

  bool get isUser => role.value == UserRole.user;

  void login(UserRole userRole) {
    role.value = userRole;
  }

  void logout() {
    role.value = null;
  }
}