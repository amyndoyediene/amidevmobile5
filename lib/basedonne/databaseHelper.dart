import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'users.dart'; // Assurez-vous d'avoir créé le modèle Users

class DatabaseHelper {
  // Singleton de la classe DatabaseHelper
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  DatabaseHelper._privateConstructor();

  static Database? _database;

  // Accès unique à l'instance de la base de données
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialisation de la base de données
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Création de la table lors de la première initialisation de la base de données
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usrName TEXT NOT NULL,
        usrPassword TEXT NOT NULL
      )
    ''');
  }

  // Méthode pour enregistrer un utilisateur
  Future<int> register(Users user) async {
    Database db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  // Méthode pour se connecter
  Future<bool> login(Users user) async {
    
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'usrName = ? AND usrPassword = ?',
      whereArgs: [user.usrName, user.usrPassword],
    );
 
 
    return result.isNotEmpty; // Retourne `true` si l'utilisateur est trouvé
  }
}
