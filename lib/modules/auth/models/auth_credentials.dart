class AuthCredentials {
  final String email;
  final String password;

  const AuthCredentials({required this.email, required this.password});

  factory AuthCredentials.fromJson(Map<String, dynamic> json) {
    return AuthCredentials(
      email: json['email'],
      password: json['password'],
    );
  }
}
