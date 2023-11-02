
import 'package:sqflite/sqflite.dart';

import 'migration.dart';

class MigrationV3 implements Migration{
  @override
  void creat(Batch batch) {
    batch.execute('create table teste2(id interge)');
  }

  @override
  void update(Batch batch) {
    batch.execute('create table teste2(id interge)');
  }
  
}