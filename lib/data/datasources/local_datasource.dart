import 'package:fl_sqlite_noted_app/data/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataSource {
  final String dbName = 'notes_local01.db';
  final String tableName = 'notes';

  Future<Database> _openDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          '''CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT,
            createdAt TEXT)''',
        );
      },
    );
  }

  //insert note
  Future<int> insert(Note note) async {
    final db = await _openDatabase();
    return await db.insert(tableName, note.toMap());
  }

  //get all notes
  Future<List<Note>> getNotes() async {
    final db = await _openDatabase();
    final maps = await db.query(tableName, orderBy: 'createdAt DESC');
    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
  }

  //get note id
  Future<Note> getNoteById(int id) async {
    final db = await _openDatabase();
    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return Note.fromMap(maps.first);
  }

  //updateNoteById
  Future<int> updateNoteById(Note note) async {
    final db = await _openDatabase();
    return await db.update(
      tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  //deleteNoteById
  Future<int> deleteNoteById(int id) async {
    final db = await _openDatabase();
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
