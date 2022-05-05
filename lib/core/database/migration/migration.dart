import 'package:sqflite/sqflite.dart';

// Aqui temos dois métodos que quem for implementar essa classe
//  vai ter que adicionar;
abstract class Migration {
  void create(Batch batch);
  void update(Batch batch);
}
