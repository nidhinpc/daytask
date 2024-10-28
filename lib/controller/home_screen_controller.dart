import 'package:sqflite/sqflite.dart';

class HomeScreenController {
  static late Database myDatabase;
  static List<Map> taskList = [];

  static Future initDb() async {
    // Open the database
    myDatabase = await openDatabase("task.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the tables
      await db.execute(
          'CREATE TABLE Task (id INTEGER PRIMARY KEY, task TEXT, details TEXT, time TEXT, date TEXT)');
    });
  }

  static Future addTask(
      {required String task,
      required String details,
      String? time,
      String? date}) async {
    await myDatabase.rawInsert(
        'INSERT INTO Task(task, details, time, date) VALUES(?, ?, ?, ?)',
        [task, details, time, date]);
    getAllTasks();
  }

  static Future getAllTasks() async {
    taskList = await myDatabase.rawQuery('SELECT * FROM Task');
    print(taskList);
  }

  static Future removeTask(int id) async {
    await myDatabase.rawDelete('DELETE FROM Task WHERE id = ?', [id]);
    getAllTasks();
  }

  static Future updateTask(String newTask, String newDetails, String newTime,
      String newDate, int id) async {
    await myDatabase.rawUpdate(
        'UPDATE Task SET task = ?, details = ?, time = ?, date = ? WHERE id = ?',
        [newTask, newDetails, newTime, newDate, id]);
    getAllTasks();
  }
}
