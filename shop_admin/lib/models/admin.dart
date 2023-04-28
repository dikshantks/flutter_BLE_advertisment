class Admin {
  int adminid;
  String name;
  String password;
  String email;

  Admin({
    required this.adminid,
    required this.name,
    required this.password,
    required this.email,
  });

  factory Admin.fromjson(Map<String, dynamic> json) => Admin(
        adminid: json["admin_id"],
        name: json["name"],
        password: json["password"],
        email: json["email"],
      );
}
