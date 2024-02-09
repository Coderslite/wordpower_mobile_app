class UserModel {
  String? email;
  String? gender;
  String? name;
  String? password;
  String? id;

  UserModel({
    this.id,
    this.gender,
    this.email,
    this.password,
    this.name,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'gender': gender,
        'email': email,
        'password': password,
        'name': name,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      gender: json['gender'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
    );
  }
}
