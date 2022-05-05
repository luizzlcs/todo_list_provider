import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:todo_list_provider/core/database/migration/migration.dart';
import 'package:todo_list_provider/core/database/sqlite_migration_factory.dart';

class SqliteConectionFactory {
  // Variaveis de representação do banco de dados.
  // Versão do banco e nome do banco de dados.
  static const _VERSION = 1;
  static const _DATABASE_NAME = 'TODO_LIST_PROVIDER';
  // Fabrica de conexões, padrão do sigton que só tem
  // uma classe que só tem uma única instacia
  // dentro do sistema como um todo;
  static SqliteConectionFactory? _instace;

  // Criando atributo de classe que vai controlar
  // se o banco dados está aberto ou fechado.
  Database? _db;

  // Lock é uma classe do pacote synchronized;
  // O Lock é utilizado para trabalhar com multitred,
  // Quando há duas conexões simultâneas com o banco de dados,
  // O Lock irá evitar que isto aconteça, iremos abrir apenas
  // uma conesão por instância.
  final _lock = Lock();
  //Criando construtor privado para conexão,
  //  para que ninguém instacie a conexão de forma natural.
  SqliteConectionFactory._();

  // Construtor do tipo factory onde será
  // controlado a instância da conexão
  factory SqliteConectionFactory() {
    if (_instace == null) {
      //Chamando o construtor privado para criar a instacia
      // Caso não exista uma instacia criada;
      _instace = SqliteConectionFactory._();
    }
    // Caso exista chama a instancia criada;
    return _instace!;
  }

  // Método de retorno do banco de dados.
  Future<Database> openConnection() async {
    var databasePath = await getDatabasesPath();
    var databasePathFinal = join(databasePath, _DATABASE_NAME);
    // O _lock foi chamado aqui para evitar a abertura de várias conexões
    await _lock.synchronized(() async {
      // Uma nova conexão só será aberta se não ouver nenhuma instância aberta.
      if (_db == null) {
        _db = await openDatabase(
          databasePathFinal,
          version: _VERSION,
          onConfigure: _onConfigure,
          onCreate: _onCreate,
          onUpgrade: _onUpgrade,
          onDowngrade: _onDawGrade,
        );
      }
    });
    return _db!;
  }

  // Criando método que fecha a conexão
  void closeConnection() {
    _db?.close();
    _db = null;
  }

  // Métodos principais de configuração
  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_key = ON');
  }

  // Fazendo a implementação dos métodos.

  // Esse primeiro método irá pecorrer todas as migration
  // e de acordo com a versão irá executar apenas uma delas.
  Future<void> _onCreate(Database db, int version) async {
    final batch = db.batch();

    final migrations = SqliteMigrationFactory().getCreateMigration();

    for (var migration in migrations) {
      migration.create(batch);
    }

    batch.commit();
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int version) async {
    final batch = db.batch();

    final migrations = SqliteMigrationFactory().getUpgradeMigration(oldVersion);

    for (var migration in migrations) {
      migration.update(batch);
    }

    batch.commit();
  }

  Future<void> _onDawGrade(Database db, int oldVersion, int version) async {}
}
