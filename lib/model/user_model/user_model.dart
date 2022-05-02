import 'package:appwrite/models.dart';

class UserModel {
  final String $id = '';

  /// User name.
  final String name = '';

  /// User registration date in Unix timestamp.
  final int registration = 0;

  /// User status. 0 for Unactivated, 1 for active and 2 is blocked.
  final int status = 0;

  /// Unix timestamp of the most recent password update
  final int passwordUpdate = 0;

  /// User email address.
  final String email = '';

  /// Email verification status.
  final bool emailVerification = false;

  /// User preferences as a key-value object
  late final Preferences prefs;
}
