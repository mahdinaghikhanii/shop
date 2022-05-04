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
  UserModel({
    required $id,
    required name,
    required registration,
    required status,
    required passwordUpdate,
    required email,
    required emailVerification,
    required prefs,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      $id: map['\$id'] as String,
      name: map['name'] as String,
      registration: map['registration'] as int,
      status: map['status'] as int,
      passwordUpdate: map['passwordUpdate'] as int,
      email: map['email'] as String,
      emailVerification: map['emailVerification'] as bool,

      // Here preference is actually a different class model. This is left
      // as an exercise for you to discover. The more you discover, the more
      // interesting it gets
      prefs: Preferences.fromMap(map['prefs']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "\$id": $id,
      "name": name,
      "registration": registration,
      "status": status,
      "passwordUpdate": passwordUpdate,
      "email": email,
      "emailVerification": emailVerification,
      "prefs": prefs.toMap(),
    };
  }
}
