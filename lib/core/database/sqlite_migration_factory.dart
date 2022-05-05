import 'package:todo_list_provider/core/database/migration/migration.dart';
import 'package:todo_list_provider/core/database/migration/migration_v1.dart';
import 'package:todo_list_provider/core/database/migration/migration_v2.dart';

import 'migration/migration_v3.dart';

// Aqui nós iremos adicionar as Migration responsáveis
// pela Criação das query do banco de dados.
// Mas antes disso vamos A primeira coisa que iremos
// fazer agora é criar uma interface das  migration na pasta migration/.
class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [
        MigrationV1(),
        MigrationV2(),
        MigrationV3(),
      ];
  // Migration de atualizações.
  List<Migration> getUpgradeMigration(int version) {
    final migrations = <Migration>[];
    // Implementação condição para pegar a migration de atualização.
    if (version == 1) {
      migrations.add(MigrationV2());
      migrations.add(MigrationV3());
    }

    if (version == 2) {
      migrations.add(MigrationV3());
    }
    return migrations;
  }
}
