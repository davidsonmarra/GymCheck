class User {
  // int id;
  // String name;
  String email;
  String password;
  // int age;

  User(
    this.email,
    this.password,
  );

  fromMap(dynamic obj) {
    // this.id = obj['userId'];
    // this.name = obj['userName'];
    this.email = obj['userEmail'];
    this.password = obj['userPassword'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'userEmail': email,
      'userPassword': password,
    };

    return map;
  }
}
