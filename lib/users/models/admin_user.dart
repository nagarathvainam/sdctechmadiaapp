class AdminUser {
  final String id;
  final String fullname;
  final String email;
  final String address;
  final String region;
  final String username;
  final String password;
  final String status;
  final String type;
  final String txnSummary;

  AdminUser({
    required this.id,
    required this.fullname,
    required this.email,
    required this.address,
    required this.region,
    required this.username,
    required this.password,
    required this.status,
    required this.type,
    required this.txnSummary,
  });

  factory AdminUser.fromJson(Map<String, dynamic> json) => AdminUser(
    id: json['admin_id'],
    fullname: json['admin_fullname'],
    email: json['admin_email'],
    address: json['admin_address'],
    region: json['region'],
    username: json['admin_username'],
    password: json['admin_password'],
    status: json['admin_status'],
    type: json['admin_type'],
    txnSummary: json['txn_summary'],
  );

  Map<String, dynamic> toJson() => {
    'admin_id': id,
    'admin_fullname': fullname,
    'admin_email': email,
    'admin_address': address,
    'region': region,
    'admin_username': username,
    'admin_password': password,
    'admin_status': status,
    'admin_type': type,
    'txn_summary': txnSummary,
  };
}