class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final int roleId;
  final int status;
  final String dob;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.roleId,
    required this.status,
    required this.dob,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: int.parse(json['id'].toString()),
    name: json['name'],
    email: json['email'],
    password: json['password'],
    phone: json['phone'],
    roleId: int.parse(json['role_id'].toString()),
    status: int.parse(json['status'].toString()),
    dob: json['dob'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'password': password,
    'phone': phone,
    'role_id': roleId,
    'status': status,
    'dob': dob,
  };
}
