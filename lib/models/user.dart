
class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String userRole;

  User({this.id, this.firstName, this.lastName, this.email, this.userRole});

  User.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        firstName = data['firstname'],
        lastName = data['lastname'],
        email = data['email'],
        userRole = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstName,
      'lastname' : lastName,
      'email': email,
      'userRole': userRole,
    };
  }
  @override toString() => this.toJson().toString();
}

