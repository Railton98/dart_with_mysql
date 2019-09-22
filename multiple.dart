import 'dart:async';
import 'package:dart_mysql/connection.dart';

main() async {
  var conn = await MySql.connect(
      host: 'localhost', user: 'dart', password: 'dart', db: 'dart');

  var sql = 'INSERT INTO users (first_name, last_name) VALUES (?, ?)';

  await conn.queryMulti(sql, [
    ['Railton', 'Teck\'s'],
    ['Pedro', 'Falção'],
    ['Luiz', 'Feitosa']
  ]);

  conn.close();
}
