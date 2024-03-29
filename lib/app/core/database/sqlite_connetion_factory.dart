import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:todo_list_laos/app/core/database/sqlite_migration_factory.dart';

class SqliteConnetionFactory {
  static const _version = 1;    
  static const _databaseName = 'TODO_LIST_PROVIDER';
  static SqliteConnetionFactory? _instance;

  Database? _db;
  final _lock = Lock();

  SqliteConnetionFactory._();

  factory SqliteConnetionFactory() {
    if (_instance == null) {
      _instance ??= SqliteConnetionFactory._();
    }

    return _instance!;
  }

  Future<Database> openConnection() async {
    var databasePath = await getDatabasesPath();
    var databasePathFinal = join(databasePath, _databaseName);
    if (_db == null) {
      await _lock.synchronized(() async {
        if (_db == null) {
          _db ==
              await openDatabase(
                databasePathFinal,
                version: _version,
                onConfigure: _onConfigure,
                onCreate: _onCreate,
                onUpgrade: _onUpgrade,
                onDowngrade: _onDowgrade,
              );
        }
      });
    }
    return _db!;
  }

  void closeConnection() {
    _db?.close();
    _db = null;
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    final batch = db.batch();

    final migrations = SqliteMigrationFactory().getCreateMigration();
    for (var migration in migrations) {
      migration.creat(batch);
    }

    batch.commit();
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int version) async {
    final batch = db.batch();

    final migrations = SqliteMigrationFactory().getUpgradeMigration(oldVersion);
    for(var migration in migrations){
      migration.update(batch);
    }


    batch.commit();
  }
  Future<void> _onDowgrade(Database db, int oldVersion, int version) async {}
}
