import 'package:sqflite/sqflite.dart';

class SqliteConnectionFactory {
  static const _version = 1;
  static const _databaseName = 'CUIDAPET_LOCAL_DB';
  static SqliteConnectionFactory? _instance;
  SqliteConnectionFactory._();

  factory SqliteConnectionFactory() {
    _instance ??= SqliteConnectionFactory._();
    return _instance!;
  }
}
