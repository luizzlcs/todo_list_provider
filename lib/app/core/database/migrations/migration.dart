


import 'package:sqflite/sqflite.dart';

abstract class Migration {
void creat(Batch batch);
void update(Batch batch);
}