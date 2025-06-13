class LocalUserModel {
  final int? id;
  final String username;
  final String email;
  final String password;
  final String mobileNumber;
  LocalUserModel(
      {this.id,
      required this.username,
      required this.email,
      required this.password,
      required this.mobileNumber});

  factory LocalUserModel.fromMap(Map<String, dynamic> json) => LocalUserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      mobileNumber: json['mobileNumber']);

  Map<String, dynamic> toMap() => {
        'id': id,
        'username': username,
        'email': email,
        'password': password,
        'mobileNumber': mobileNumber
      };
}
