

import 'package:sqflite/sqflite.dart';
import 'package:todo_list_laos/app/core/database/migrations/migration.dart';

class MigrationV1 implements Migration {
  @override
  void creat(Batch batch) {
    batch.execute('''
        create table todo(
          id Interge primary key autoincrement,
          descricao varchar(500) not null,
          data_hora datetime,
          finalizado interger,
        )
      ''');
  }

  @override
  void update(Batch batch) {
    // TODO: implement update
  }
}
