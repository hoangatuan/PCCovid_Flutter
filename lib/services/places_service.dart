import 'package:pccovid/models/place.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PlacesDatabase {
  static final PlacesDatabase instaces = PlacesDatabase._init();

  static Database? _database;

  PlacesDatabase._init();

  // Open connection before read/write
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('places.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const stringType = "TEXT NOT NULL";

    await db.execute('''
      CREATE TABLE $tablePlaces ( 
        ${PlaceFields.id} $idType,
        ${PlaceFields.location} $stringType,
        ${PlaceFields.date} $stringType
      )
    ''');
  }

  Future<bool> create(Place place) async {
    final db = await database;
    int res = await db.insert(tablePlaces, place.toJson());
    bool isSuccess = res != 0;
    return isSuccess;
  }

  Future<List<Place>> getAllPlaces() async {
    final db = await database;

    final maps = await db.query(tablePlaces, columns: PlaceFields.values);
    return maps.map((e) => Place.fromJson(e)).toList();
  }

  Future close() async {
    final db = await instaces.database;
    db.close();
  }
}
