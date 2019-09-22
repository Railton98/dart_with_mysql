import 'dart:async';
import 'package:mysql1/mysql1.dart';

class MySql {
  static final _singleton = new MySql._internal();

  factory MySql() {
    return _singleton;
  }

  MySql._internal();

  static MySqlConnection _connection;

  static Future<MySqlConnection> connect(
      {String host,
      int port: 3306,
      String user,
      String password: null,
      String db}) async {
    if (_connection != null) {
      return _connection;
    }
    var settings = new ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
    );

    _connection = await MySqlConnection.connect(settings);

    return _connection;
  }
}
