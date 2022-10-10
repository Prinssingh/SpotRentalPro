
import 'package:spot_buy/Models/UserDataModel.dart';
import 'package:sqflite/sqflite.dart';

import 'database_service.dart';

class UserDataBase{
  var dataBase = DatabaseService();
  // Data Base Functions
  static String TABLE_NAME ="user_data";
  static String CreateTableQuery="CREATE TABLE $TABLE_NAME(id INTEGER PRIMARY KEY AUTOINCREMENT, first_name TEXT NOT NULL, last_name TEXT, gender TEXT, address TEXT, mobile TEXT, email TEXT, photo BLOB)";



  Future<void> insert(UserDataModel user) async {
    // Get a reference to the database.
    final db = await dataBase.database;
    await db.insert(
     TABLE_NAME,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the breeds from the breeds table.
  Future<List<UserDataModel>> listAllUsers() async {
    // Get a reference to the database.
    final db = await dataBase.database;

    // Query the table for all the Breeds.
    final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);

    // Convert the List<Map<String, dynamic> into a List<Breed>.
    return List.generate(maps.length, (index) => UserDataModel.fromMap(maps[index]));
  }

  Future<UserDataModel> getUserDataByID(int id) async {
    final db = await dataBase.database;
    final List<Map<String, dynamic>> maps =
    await db.query(TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return UserDataModel.fromMap(maps[0]);
  }

  Future<UserDataModel> getUser() async {
    final db = await dataBase.database;
    final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);
    return List.generate(maps.length, (index) => UserDataModel.fromMap(maps[index]))[0];
  }

  // A method that updates a User data from the breeds table.
  Future<void> updateUser(UserDataModel user) async {
    // Get a reference to the database.
    final db = await dataBase.database;

    // Update the given breed
    await db.update(
      TABLE_NAME,
      user.toMap(),
      // Ensure that the Breed has a matching id.
      where: 'id = ?',
      // Pass the Breed's id as a whereArg to prevent SQL injection.
      whereArgs: [user.id],
    );
  }

  // A method that deletes a user data from the breeds table.
  Future<void> deleteUser(int id) async {
    // Get a reference to the database.
    final db = await dataBase.database;

    // Remove the Breed from the database.
    await db.delete(
      TABLE_NAME,
      // Use a `where` clause to delete a specific breed.
      where: 'id = ?',
      // Pass the Breed's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }


}