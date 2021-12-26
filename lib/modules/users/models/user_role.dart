enum _Role {
  admin,
  editor,
  member,
}

class UserRole {
  final _Role role;

  const UserRole({required this.role});

  String get name => '${role.name[0].toUpperCase()}${role.name.substring(1)}';
  bool get isAdmin => role == _Role.admin;
  bool get isEditor => role == _Role.editor;
  bool get isMember => role == _Role.member;

  int get value => role.index + 1;

  factory UserRole.fromValue(int value) {
    return UserRole(role: _Role.values[value - 1]);
  }
}
