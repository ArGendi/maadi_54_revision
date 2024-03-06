import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServices{

  Future<Database> initDB() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, "source.db"),
      version: 1,
      onCreate: (db, version){
        db.execute("CREATE TABLE notes(title TEXT, content TEXT)");
      }
    );
  }

  void insert(String title, String content) async{
    var db = await initDB();
    db.insert("notes", {
      "title": title,
      "content": content,
    });
  }
}