import 'package:sqflite_common/sqlite_api.dart';
import 'package:todo_list_provider/core/database/migration/migration.dart';

// Criando a estrutura básica de nossa tabela
class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      create table todo(
        id integer primary key autoincrement,
        descricao varchar(500) not null,
        data_hora datetime,
        finalizado integer
      )
    ''');
  }

  // Para primeira versão do App nós não temos atualizações,
  // por isso não iremos implementar o métdo update;
  @override
  void update(Batch batch) {}
}
