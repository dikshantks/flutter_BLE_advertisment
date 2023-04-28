import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = "34.131.60.119",
      user = "admins",
      db = "project",
      password = "password";

  static int port = 3306;
  Mysql();
  Future<MySqlConnection> getconnection() async {
    var setting = ConnectionSettings(
      db: db,
      port: port,
      host: host,
      password: password,
      user: user,
    );

    return MySqlConnection.connect(setting);
  }
}
