class UserModel {
  String? uId;
  String? firstname;
  String? lastname;
  String? email;
  String? phoneNumber;

  UserModel({
    this.email,
    this.firstname,
    this.lastname,
    this.phoneNumber,
    this.uId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phoneNumber: json['phoneNumber'],
      uId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phoneNumber': phoneNumber,
      'userId': uId,
    };
  }
}
