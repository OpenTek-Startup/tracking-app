class User {
  final String id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.email,
    required this.name,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: ['\$id'].toString(),
        email: ['email'].toString(),
        name: ['name'].toString());
  }

  Map<String, dynamic> toMap() {
    return {
      '\$id': id,
      'email': email,
      'name': name,
    };
  }
}
