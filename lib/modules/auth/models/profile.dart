import 'package:enterprise_flutter/modules/users/models/user_role.dart';

class Profile {
  final int id;
  final String email;
  final String avatar;
  final String name;
  final UserRole role;

  const Profile({
    required this.id,
    required this.email,
    required this.avatar,
    required this.name,
    required this.role,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    final profile = json['user'];

    return Profile(
      id: profile['id'],
      email: profile['email'],
      avatar: profile['avatar'],
      name: profile['name'],
      role: UserRole.fromValue(profile['role']),
    );
  }
}
