

class WooUser {
  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? name;

  WooUser(
      {this.id,
      required String this.email,
      required String this.username,
      this.password,
      this.firstName,
      this.lastName,
      this.name});

  WooUser.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        email = data['email'],
        username = data['username'],
        password = data['password'],
        firstName = data['first_name'],
        lastName = data['last_name'],
        name = data['name'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'name': name,
    };
  }

  @override
  toString() => this.toJson().toString();
}
