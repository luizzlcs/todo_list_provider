
import 'package:sqflite/sqflite.dart';
import 'package:todo_list_laos/app/core/database/migrations/migration.dart';

class MigrationV2 implements Migration{
  @override
  void creat(Batch batch) {
    batch.execute('create table teste(id interge)');
  }

  @override
  void update(Batch batch) {
    batch.execute('create table teste(id interge)');
  }
  
}