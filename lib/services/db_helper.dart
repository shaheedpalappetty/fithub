import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const dbName = 'workoutAppDB.db';
  static const dbVersion = 1;
  //UserTable
  static const dbUsersTable = 'userDetails';
  static const columnId = 'userId';
  static const columnName = 'userName';
  static const columnPassword = 'userPassword';
  static const columnEmail = 'userEmail';
  static const columnImage = 'userImage';
  static const columnGender = 'userGender';
  static const columnAge = 'userAge';
  static const columnWeight = 'userWeight';
  static const columnHeight = 'userHeight';
  static const columnGoal = 'userGoal';
  static const columnActivityLevel = 'userActivityLevel';
  static const columnLoggedinStatus = 'userLoggedinStatus';
//overall Table
  static const dbWorkoutTable = 'WorkoutTable';
  static const columnWorkoutId = 'id';
  static const columnWorkoutUserId = 'UserId';
  static const columnDate = 'Date';
  static const columnChest = 'Chest';
  static const columnBiceps = 'Biceps';
  static const columnBack = 'Back';
  static const columnTriceps = 'Triceps';
  static const columnCalorieIntake = 'CalorieIntake';
  static const columnWorkoutTotal = 'Total';

//Chest TAble
  static const dbChestTable = 'ChestTable';
  static const columnChestId = 'Id';
  static const columnChestUserId = 'UserId';
  static const columnChestDate = 'Date';
  static const columnBenchPress = 'BenchPress';
  static const columnInclinePress = 'InclinePress';
  static const columnDeclineBenchPress = 'DeclineBenchPress';
  static const columnDumbellFlys = 'DumbbellFlys';
  static const columnPushups = 'PushUps';
  static const columnCableCrossoverFlys = 'CableCrossoverFlys';
  static const columnPecDeckFlies = 'PecDeckFlies';
  static const columnDeclinePushup = 'DeclinePushup';
  static const columnDumbbellPullovers = 'DumbbellPullovers';
  static const columnParallelBarDips = 'ParallelBarDips';
  static const columnDumbbellPress = 'DumbbellPress';
  static const columnBarbellBenchPress = 'BarbellBenchPress';
  static const columnChestTotal = 'Total';

//Biceps Table
  static const dbBicepsTable = 'BicepsTable';
  static const columnBicepsId = 'Id';
  static const columnBicepsUserId = 'UserId';
  static const columnBicepsDate = 'Date';
  static const columnBarbellCurls = 'BarbellCurls';
  static const columnReverseCurls = 'ReverseCurls';
  static const columnPreacherCurls = 'PreacherCurls';
  static const columnCableBicepsCurl = 'CableBicepsCurl';
  static const columnDumbbellBicepsCurl = 'DumbbellBicepsCurl';
  static const columnDumbbellCurl = 'DumbbellCurl';
  static const columnDumbbellCurlStand = 'DumbbellCurlStand';
  static const columnBicepsTotal = 'Total';

//Back Table
  static const dbBackTable = 'BackTable';
  static const columnBackId = 'Id';
  static const columnBackUserId = 'UserId';
  static const columnBackDate = 'Date';
  static const columnChinUps = 'ChinUps';
  static const columnLatPullDown = 'LatPullDown';
  static const columnBackExtensions = 'BackExtensions';
  static const columnDeadLifts = 'DeadLifts';
  static const columnT_barBentOverRow = 'TBarBentOverRow';
  static const columnSeatedRows = 'SeatedRows';
  static const columnOneArmDumbbell = 'OneArmDumbbellRows';
  static const columnBentOverRow = 'BentOverRow';
  static const columnDumbbellBentOverRow = 'DumbbellBentOverRow';
  static const columnSeatedBentOverRow = 'SeatedBentOverRow';
  static const columnBackTotal = 'Total';
// Triceps Table
  static const dbTricepsTable = 'TricepsTable';
  static const columnTricepsId = 'id';
  static const columnTricepsUserId = 'UserId';
  static const columnTricepsDate = 'Date';
  static const columnDiamondPushUp = 'DiamondPushUp';
  static const columnCloseGripBenchPress = 'CloseGripBenchPress';
  static const columnBarbellLyingTricep = 'BarbellLyingTricep';
  static const columnDumbbellRowKickBack = 'DumbbellRowKickBack';
  static const columnTricepsPushDown = 'TricepsPushDown';
  static const columnOneArmDumbbellTriceps = 'OneArmDumbbellTricepsExtensions';
  static const columnSideOneArmReversePushDown = 'SideOneArmReversePushDown';
  static const columnSeatedTricepsExtension = 'SeatedTricepsExtension';
  static const columnTricepsDips = 'TricepsDips';
  static const columnTricepsKickBack = 'TricepsKickBack';
  static const columnBarTricepsExtension = 'BarTricepsExtension';
  static const columnTricepsTotal = 'Total';

//Constructor
  static final DatabaseHelper instance = DatabaseHelper();

// database initialise
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
  }

  Future onCreate(db, dbVersion) async {
    //user Table
    db.execute('''CREATE TABLE $dbUsersTable(
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnName TEXT NOT NULL,
      $columnPassword TEXT NOT NULL,
      $columnEmail TEXT NOT NULL,
      $columnImage TEXT,
      $columnGender TEXT,
      $columnAge INTEGER,
      $columnWeight INTEGER,
      $columnHeight INTEGER,
      $columnGoal TEXT,
      $columnActivityLevel INTEGER,
      $columnLoggedinStatus DEFAULT 0 
      )''');
    //Overall Table
    db.execute('''CREATE TABLE $dbWorkoutTable(
      $columnWorkoutId INTEGER PRIMARY KEY,
      $columnWorkoutUserId INTEGER NOT NULL,
      $columnDate TEXT NOT NULL,
      $columnChest DEFAULT 0,
      $columnBiceps DEFAULT 0,
      $columnBack DEFAULT 0,
      $columnTriceps DEFAULT 0,
      $columnCalorieIntake DEFAULT 0,
      $columnWorkoutTotal  DEFAULT 0
      )''');

    //Chest Table
    db.execute('''CREATE TABLE $dbChestTable(
        $columnChestId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnChestUserId INTEGER NOT NULL,
        $columnChestDate TEXT NOT NULL,
        $columnBenchPress DEFAULT 0,
        $columnInclinePress DEFAULT 0,
        $columnDeclineBenchPress DEFAULT 0,
        $columnDumbellFlys DEFAULT 0,
        $columnPushups DEFAULT 0,
        $columnCableCrossoverFlys DEFAULT 0,
        $columnPecDeckFlies DEFAULT 0,
        $columnDeclinePushup DEFAULT 0,
        $columnDumbbellPullovers DEFAULT 0,
        $columnParallelBarDips DEFAULT 0,
        $columnDumbbellPress DEFAULT 0,
        $columnBarbellBenchPress DEFAULT 0,
        $columnChestTotal  DEFAULT 0
         )
''');
//Biceps Table
    db.execute('''CREATE TABLE $dbBicepsTable(
        $columnBicepsId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnBicepsUserId INTEGER NOT NULL,
        $columnBicepsDate TEXT NOT NULL,
        $columnBarbellCurls DEFAULT 0,
        $columnReverseCurls DEFAULT 0,
        $columnPreacherCurls DEFAULT 0,
        $columnCableBicepsCurl DEFAULT 0,
        $columnDumbbellBicepsCurl DEFAULT 0,
        $columnDumbbellCurl DEFAULT 0,
        $columnDumbbellCurlStand DEFAULT 0,
        $columnBicepsTotal  DEFAULT 0
          )
''');

//Back Table
    db.execute('''CREATE TABLE $dbBackTable(
        $columnBackId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnBackUserId INTEGER NOT NULL,
        $columnBackDate TEXT NOT NULL,
        $columnChinUps DEFAULT 0,
        $columnLatPullDown DEFAULT 0,
        $columnBackExtensions DEFAULT 0,
        $columnDeadLifts DEFAULT 0,
        $columnT_barBentOverRow DEFAULT 0,
        $columnSeatedRows DEFAULT 0,
        $columnOneArmDumbbell DEFAULT 0,
        $columnBentOverRow DEFAULT 0,
        $columnDumbbellBentOverRow DEFAULT 0,
        $columnSeatedBentOverRow DEFAULT 0,
        $columnBackTotal  DEFAULT 0
        )
''');
//Triceps Table
    db.execute('''CREATE TABLE $dbTricepsTable(
        $columnTricepsId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTricepsUserId INTEGER NOT NULL,
        $columnTricepsDate TEXT NOT NULL,
        $columnDiamondPushUp DEFAULT 0,
        $columnCloseGripBenchPress DEFAULT 0,
        $columnBarbellLyingTricep DEFAULT 0,
        $columnDumbbellRowKickBack DEFAULT 0,
        $columnTricepsPushDown DEFAULT 0,
        $columnOneArmDumbbellTriceps DEFAULT 0,
        $columnSideOneArmReversePushDown DEFAULT 0,
        $columnSeatedTricepsExtension DEFAULT 0,
        $columnTricepsDips DEFAULT 0,
        $columnTricepsKickBack DEFAULT 0,
        $columnBarTricepsExtension DEFAULT 0,
        $columnTricepsTotal  DEFAULT 0
      )
''');
  }

//Insert(Create)
  Future<int> addUserDetails(Map<String, dynamic> row) async {
    try {
      print('Adding inside the database');
      Database? db = await instance.database;
      return await db!.insert(dbUsersTable, row);
    } catch (e) {
      print('Error adding user details: $e');
      return -1; // Return a negative value to indicate failure
    }
  }

  // addUserDetails(Map<String, dynamic> row) async {
  //   print('Addind inside db');
  //   Database? db = await instance.database;
  //   return await db!.insert(dbUsersTable, row);
  // }

//Query(Read)
  Future<List<Map<String, dynamic>>> getAllUserDetails() async {
    Database? db = await instance.database;
    final temp = await db!.query(dbUsersTable);
    print('inside db:-$temp');
    return temp;
  }

  //Update

  Future<int> updateUserDetails(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!
        .update(dbUsersTable, row, where: '$columnId=?', whereArgs: [id]);
  }

  //delete
  Future<int> deleteUserDetails(int id) async {
    Database? db = await instance.database;
    return await db!
        .delete(dbUsersTable, where: '$columnId=?', whereArgs: [id]);
  }

//getUserId with UserName
  Future<int?> getUserIdbyUserName(String userName) async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> result = await db!.query(dbUsersTable,
        where: '$columnName=?', whereArgs: [userName], limit: 1);
    if (result.isNotEmpty) {
      return result.first['userId'] as int?;
    } else {
      return null;
    }
  }

//check Username Availability
  Future<bool> checkUsernameAvailability(String username) async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> result = await db!.query(dbUsersTable,
        where: '$columnName=?', whereArgs: [username], limit: 1);
    return result.isEmpty;
  }

//login

  Future<Map<String, dynamic>> login(String username, String password) async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> result = await db!.query(
      dbUsersTable,
      where: '$columnName=? AND $columnPassword=?',
      whereArgs: [username, password],
    );
    print('result db: $result');
    if (result.isNotEmpty) {
      int id = result.first[columnId];
      await db.update(
        dbUsersTable,
        {'userLoggedinStatus': 1},
        where: '$columnId = ?',
        whereArgs: [id],
      );
    }
    return result.first;
  }

  // check which is user is logged in
  Future<Map<String, dynamic>> checkLoggedIn() async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> result = await db!.query(
      dbUsersTable,
      where: '$columnLoggedinStatus=?',
      whereArgs: [1],
    );

    // Check if the result list is not empty before accessing the first element.
    if (result.isNotEmpty) {
      return result.first;
    } else {
      // Return null or some default value indicating no logged-in user.
      return {};
    }
  }

  //user details of Logged User(Splash)
  Future<Map<String, dynamic>> loggedInUserDetails() async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> result = await db!
        .query(dbUsersTable, where: '$columnLoggedinStatus=?', whereArgs: [1]);
    return result.first;
  }

  signOut() async {
    print('Inside SignOut');
    Database? db = await instance.database;
    List<Map<String, dynamic>> result = await db!.query(dbUsersTable,
        where: '$columnLoggedinStatus=?', whereArgs: [1], limit: 1);

    print('Logged in User:-$result');

    if (result.isNotEmpty) {
      int id = result.first[columnId];

      print('ID:$id');
      await db.update(
        dbUsersTable,
        {'userLoggedinStatus': 0},
        where: '$columnId = ?',
        whereArgs: [id],
      );
      print('User logged out successfully.');
    }
  }

// ***********************Chest TAble***********************************
  //Add to details to Chest Table(Insert)

  Future<void> addToChest(Map<String, dynamic> row) async {
    print("Adding to Chest Table");
    Database? db = await instance.database;

    // get the current date
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // Get the userId from the row
    int userId = row['UserId'];
    row[columnChestDate] = currentDate;

    // Check if the  already exists in the table
    List<Map<String, dynamic>> existingRows = await db!.query(
      dbChestTable,
      where: '$columnChestUserId=? AND $columnChestDate=?',
      whereArgs: [userId, currentDate],
    );

    if (existingRows.isEmpty) {
      // If the userId does not exist, insert a new row
      await db.insert(dbChestTable, row);
      print("Inserted new row in Chest Table");
    }
  }

  //Get All Values in Chest Table(Query)

  Future<List<Map<String, dynamic>>> getAllChestDetails() async {
    Database? db = await instance.database;
    final temp = await db!.query(dbChestTable);
    print('inside db:-$temp');
    return temp;
  }

  //Update users Chest workout Details

  Future<int> updateUserChestDetails(Map<String, dynamic> row) async {
    print("Updating to Chest Table");
    Database? db = await instance.database;

    int id = row[columnChestUserId];

    // Fetch the existing data from the database
    List<Map<String, dynamic>>? rowFromDB = await db!.query(dbChestTable,
        columns: [
          columnBenchPress,
          columnInclinePress,
          columnDeclineBenchPress,
          columnDumbellFlys,
          columnPushups,
          columnCableCrossoverFlys,
          columnPecDeckFlies,
          columnDeclinePushup,
          columnDumbbellPullovers,
          columnParallelBarDips,
          columnDumbbellPress,
          columnBarbellBenchPress,
          columnChestTotal,
        ],
        where: '$columnChestUserId=?',
        whereArgs: [id]);
    final data = rowFromDB.first;

    if (data.isNotEmpty) {
      row = {...data, ...row};
    }

    // Calculate the total value for the "Chest" exercises
    num total = row[columnBenchPress] +
        row[columnInclinePress] +
        row[columnDeclineBenchPress] +
        row[columnDumbellFlys] +
        row[columnPushups] +
        row[columnCableCrossoverFlys] +
        row[columnPecDeckFlies] +
        row[columnDeclinePushup] +
        row[columnDumbbellPullovers] +
        row[columnParallelBarDips] +
        row[columnDumbbellPress] +
        row[columnBarbellBenchPress];

    // Update the 'columnChestTotal' value in the database
    row[columnChestTotal] = total;

    print('updating row to chest table:-  $row');
    final updaterow = await db.update(dbChestTable, row,
        where: '$columnChestUserId=?', whereArgs: [id]);

    return updaterow;
  }

//delete
  Future<int> deleteUserChestDetails(int userId) async {
    Database? db = await instance.database;
    return await db!.delete(dbChestTable,
        where: '$columnChestUserId=?', whereArgs: [userId]);
  }

  // ***********************Biceps TAble***********************************
  //Add to details to Biceps Table(Insert)

  Future<void> addToBiceps(Map<String, dynamic> row) async {
    print("Adding to Biceps Table");
    Database? db = await instance.database;

    // get the current date
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // Get the userId from the row
    int userId = row['UserId'];
    row[columnBicepsDate] = currentDate;

    // Check if the userId already exists in the table
    List<Map<String, dynamic>> existingRows = await db!.query(
      dbBicepsTable,
      where: '$columnBicepsUserId = ? AND $columnBicepsDate=?',
      whereArgs: [userId, currentDate],
    );

    if (existingRows.isEmpty) {
      // If the userId does not exist, insert a new row
      await db.insert(dbBicepsTable, row);
      print("Inserted new row in Biceps Table");
    }
  }

  //Get All Values in Biceps Table(Query)

  Future<List<Map<String, dynamic>>> getAllBicepsDetails() async {
    Database? db = await instance.database;
    final temp = await db!.query(dbBicepsTable);
    print('inside db:-$temp');
    return temp;
  }

  //Update users Biceps workout Details
  Future<int> updateUserBicepsDetails(Map<String, dynamic> row) async {
    print("Updated to Biceps Table");
    Database? db = await instance.database;

    int id = row[columnBicepsUserId];
    List<Map<String, dynamic>>? rowFromDB = await db!.query(dbBicepsTable,
        columns: [
          columnBarbellCurls,
          columnReverseCurls,
          columnPreacherCurls,
          columnCableBicepsCurl,
          columnDumbbellBicepsCurl,
          columnDumbbellCurl,
          columnDumbbellCurlStand,
          columnBicepsTotal,
        ],
        where: '$columnBicepsUserId=?',
        whereArgs: [id]);
    final data = rowFromDB.first;

    if (data.isNotEmpty) {
      row = {...data, ...row};
    }

    // Calculate the total value for the "Biceps" exercises
    num total = row[columnBarbellCurls] +
        row[columnReverseCurls] +
        row[columnPreacherCurls] +
        row[columnCableBicepsCurl] +
        row[columnDumbbellBicepsCurl] +
        row[columnDumbbellCurl] +
        row[columnDumbbellCurlStand];

    // Update the 'columnBicepsTotal' value in the database
    row[columnBicepsTotal] = total;

    print('updating row to Biceps table:-  $row');
    final updaterow = await db.update(dbBicepsTable, row,
        where: '$columnBicepsUserId=?', whereArgs: [id]);

    return updaterow;
  }

//delete
  Future<int> deleteUserBicepsDetails(int userId) async {
    Database? db = await instance.database;
    return await db!.delete(dbBicepsTable,
        where: '$columnBicepsUserId=?', whereArgs: [userId]);
  }

  // ***********************BACK TABLE***********************************
  //Add to details to Back Table(Insert)

  Future<void> addToBack(Map<String, dynamic> row) async {
    print("Adding to Back Table");
    Database? db = await instance.database;
    // get the current date
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // Get the userId from the row
    int userId = row['UserId'];
    row[columnBackDate] = currentDate;
    // Check if the userId already exists in the table
    List<Map<String, dynamic>> existingRows = await db!.query(
      dbBackTable,
      where: '$columnBackUserId = ? AND $columnBackDate=?',
      whereArgs: [userId, currentDate],
    );

    if (existingRows.isEmpty) {
      // If the userId does not exist, insert a new row
      await db.insert(dbBackTable, row);
      print("Inserted new row in Back Table");
    }
  }

  //Get All Values in BACK Table(Query)

  Future<List<Map<String, dynamic>>> getAllBackDetails() async {
    Database? db = await instance.database;
    final temp = await db!.query(dbBackTable);
    print('inside db:-$temp');
    return temp;
  }

  //Update users BACK workout Details
  Future<int> updateUserBackDetails(Map<String, dynamic> row) async {
    print("Updated to Back Table");
    Database? db = await instance.database;
    int id = row[columnBackUserId];
    // Fetch the existing data from the database
    List<Map<String, dynamic>>? rowFromDB = await db!.query(dbBackTable,
        columns: [
          columnChinUps,
          columnLatPullDown,
          columnBackExtensions,
          columnDeadLifts,
          columnT_barBentOverRow,
          columnSeatedRows,
          columnOneArmDumbbell,
          columnBentOverRow,
          columnDumbbellBentOverRow,
          columnSeatedBentOverRow,
          columnBackTotal,
        ],
        where: '$columnBackUserId=?',
        whereArgs: [id]);
    final data = rowFromDB.first;

    if (data.isNotEmpty) {
      row = {...data, ...row};
    }

    // Calculate the total value for the "Back" exercises
    num total = row[columnChinUps] +
        row[columnLatPullDown] +
        row[columnBackExtensions] +
        row[columnDeadLifts] +
        row[columnT_barBentOverRow] +
        row[columnSeatedRows] +
        row[columnOneArmDumbbell] +
        row[columnBentOverRow] +
        row[columnDumbbellBentOverRow] +
        row[columnSeatedBentOverRow];

    // Update the 'columnBackTotal' value in the database
    row[columnBackTotal] = total;

    print('updating row to Back table:-  $row');
    final updaterow = await db.update(dbBackTable, row,
        where: '$columnBackUserId=?', whereArgs: [id]);

    return updaterow;
  }

//delete
  Future<int> deleteUserBackDetails(int userId) async {
    Database? db = await instance.database;
    return await db!
        .delete(dbBackTable, where: '$columnBackUserId=?', whereArgs: [userId]);
  }

  // ***********************Triceps TABLE***********************************
  //Add to details to Triceps Table(Insert)
  Future<void> addToTriceps(Map<String, dynamic> row) async {
    print("Adding to Triceps Table");
    Database? db = await instance.database;

    // get the current date
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // Get the userId from the row
    int userId = row['UserId'];
    row[columnTricepsDate] = currentDate;

    // Check if the userId already exists in the table
    List<Map<String, dynamic>> existingRows = await db!.query(
      dbTricepsTable,
      where: '$columnTricepsUserId = ? AND $columnTricepsDate=?',
      whereArgs: [userId, currentDate],
    );

    if (existingRows.isEmpty) {
      // If the userId does not exist, insert a new row
      await db.insert(dbTricepsTable, row);
      print("Inserted new row in Triceps Table");
    }
  }

  //Get All Values in Triceps Table(Query)

  Future<List<Map<String, dynamic>>> getAllTricepsDetails() async {
    Database? db = await instance.database;
    final temp = await db!.query(
      dbTricepsTable,
    );
    print('inside db:-$temp');
    return temp;
  }

  //Update users Triceps workout Details
  Future<int> updateUserTricepsDetails(Map<String, dynamic> row) async {
    print("Updated Triceps Table");
    Database? db = await instance.database;
    int id = row[columnTricepsUserId];
    // Fetch the existing data from the database
    List<Map<String, dynamic>>? rowFromDB = await db!.query(dbTricepsTable,
        columns: [
          columnDiamondPushUp,
          columnCloseGripBenchPress,
          columnBarbellLyingTricep,
          columnDumbbellRowKickBack,
          columnTricepsPushDown,
          columnOneArmDumbbellTriceps,
          columnSideOneArmReversePushDown,
          columnSeatedTricepsExtension,
          columnTricepsDips,
          columnTricepsKickBack,
          columnBarTricepsExtension,
          columnTricepsTotal,
        ],
        where: '$columnTricepsUserId=?',
        whereArgs: [id]);
    final data = rowFromDB.first;

    if (data.isNotEmpty) {
      row = {...data, ...row};
    }

    // Calculate the total value for the "Triceps" exercises
    num total = row[columnDiamondPushUp] +
        row[columnCloseGripBenchPress] +
        row[columnBarbellLyingTricep] +
        row[columnDumbbellRowKickBack] +
        row[columnTricepsPushDown] +
        row[columnOneArmDumbbellTriceps] +
        row[columnSideOneArmReversePushDown] +
        row[columnSeatedTricepsExtension] +
        row[columnTricepsDips] +
        row[columnTricepsKickBack] +
        row[columnBarTricepsExtension];

    // Update the 'columnTricepsTotal' value in the database
    row[columnTricepsTotal] = total;

    print('updating row to Triceps table:-  $row');
    final updaterow = await db.update(dbTricepsTable, row,
        where: '$columnTricepsUserId=?', whereArgs: [id]);

    return updaterow;
  }

//delete Triceps table
  Future<int> deleteUserTricepsDetails(int userId) async {
    Database? db = await instance.database;
    return await db!.delete(dbTricepsTable,
        where: '$columnTricepsUserId=?', whereArgs: [userId]);
  }

//***********************Overall Table*******************************/
// Update or insert overall table data for the specified user and current date
  Future<void> createOrUpdateOverallTable(int userId) async {
    //Get the current date in the format "yyyy-MM-dd"
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    //Getting details from database
    Database? db = await instance.database;

    // Check wheather a row created for on that specific date
    List<Map<String, dynamic>> existingRows = await db!.query(dbWorkoutTable,
        where: '$columnWorkoutUserId = ? AND $columnDate = ?',
        whereArgs: [userId, currentDate]);
//if row already exists
    print('Inside:- CREATE OR UPDATE function');
    if (existingRows.isNotEmpty) {
      //Get the values from other tables
      Map<String, dynamic>? chestData =
          await getExerciseDataFromTable(dbChestTable, userId);
      Map<String, dynamic>? bicepsData =
          await getExerciseDataFromTable(dbBicepsTable, userId);
      Map<String, dynamic>? backData =
          await getExerciseDataFromTable(dbBackTable, userId);
      Map<String, dynamic>? tricepsData =
          await getExerciseDataFromTable(dbTricepsTable, userId);
      // Calculate the overall workout total
      num overallTotal = (chestData[columnChestTotal] ?? 0) +
          (bicepsData[columnBicepsTotal] ?? 0) +
          (backData[columnBackTotal] ?? 0) +
          (tricepsData[columnTricepsTotal] ?? 0);
      //Create a row to update in Overall Table
      Map<String, dynamic> updatedRow = {
        columnChest: chestData[columnChestTotal],
        columnBiceps: bicepsData[columnBicepsTotal],
        columnBack: backData[columnBackTotal],
        columnTriceps: tricepsData[columnTricepsTotal],
        columnWorkoutTotal: overallTotal,
      };
      await db.update(dbWorkoutTable, updatedRow,
          where: '$columnWorkoutUserId = ? AND $columnDate = ?',
          whereArgs: [userId, currentDate]);
      print('updated row Overall Table:- $updatedRow');
    } else {
      // If no row exists, insert a new row in the "OverallTable"

      // Insert a new row in the "OverallTable" with the new values
      Map<String, dynamic> newRow = {
        columnWorkoutUserId: userId,
        columnDate: currentDate,
        columnChest: 0,
        columnBiceps: 0,
        columnBack: 0,
        columnTriceps: 0,
        columnCalorieIntake: 0,
        columnWorkoutTotal: 0
      };

      await db.insert(dbWorkoutTable, newRow);
      print('Created row in Overall Table:-  $newRow');
    }
  }

  // Helper function to get exercise data from a specific table for a given user
  Future<Map<String, dynamic>> getExerciseDataFromTable(
      String table, int userId) async {
    Database? db = await instance.database;
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    List<Map<String, dynamic>> data = await db!.query(table,
        where: 'UserId = ? AND Date=?', whereArgs: [userId, currentDate]);
    if (data.isNotEmpty) {
      return data.first;
    } else {
      return {};
    }
  }

  //Print user workout details from Overall Table
  Future<void> printOverallRowByUserId(int userId) async {
    Database? db = await instance.database;
    //Get the current date in the format "yyyy-MM-dd"
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // Query the "OverallTable" for the row with the specified userId
    List<Map<String, dynamic>> overallRows = await db!.query(
      dbWorkoutTable,
      where: '$columnWorkoutUserId = ? AND $columnDate=?',
      whereArgs: [userId, currentDate],
    );

    if (overallRows.isNotEmpty) {
      // Print the retrieved row
      Map<String, dynamic> overallRow = overallRows.first;
      print('Overall Row for UserId $userId: $overallRow');
    } else {
      print('No Overall Row found for UserId $userId.');
    }
  }

  Future<Map<String, dynamic>> getCalorieDetails(int userId) async {
    Database? db = await instance.database;
    //Get the current date in the format "yyyy-MM-dd"
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // Query to get the row with the specified userId and date
    List<Map<String, dynamic>> overallRows = await db!.query(
      dbWorkoutTable,
      where: '$columnWorkoutUserId = ? AND $columnDate=?',
      whereArgs: [userId, currentDate],
    );

    if (overallRows.isNotEmpty) {
      return overallRows.first;
    } else {
      return {};
    }
  }

  addCalorieIntake(int userId, double calorieIntake) async {
    Database? db = await instance.database;
    //Get the current date in the format "yyyy-MM-dd"
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // Query to get the row with the specified userId and date
    List<Map<String, dynamic>> overallRows = await db!.query(
      dbWorkoutTable,
      where: '$columnWorkoutUserId = ? AND $columnDate=?',
      whereArgs: [userId, currentDate],
    );
    if (overallRows.isNotEmpty) {
      Map<String, dynamic> result = Map.from(overallRows.first);
      result[columnCalorieIntake] = result[columnCalorieIntake] + calorieIntake;
      // Update the row in the database
      await db.update(
        dbWorkoutTable,
        result,
        where: '$columnWorkoutUserId = ? AND $columnDate = ?',
        whereArgs: [userId, currentDate],
      );
    } else {
      // Insert a new row in the "OverallTable" with the new values
      Map<String, dynamic> newRow = {
        columnWorkoutUserId: userId,
        columnDate: currentDate,
        columnChest: 0,
        columnBiceps: 0,
        columnBack: 0,
        columnTriceps: 0,
        columnCalorieIntake: 0,
        columnWorkoutTotal: 0
      };

      await db.insert(dbWorkoutTable, newRow);
    }
  }

  //on search
  Future<List<Map<String, dynamic>>> searchFromDB(DateTime startDate,
      DateTime endDate, String muscleType, int userId) async {
    Database? db = await instance.database;
    if (muscleType == 'All') {
      List<Map<String, dynamic>> chestData = await db!.rawQuery(
          'SELECT * FROM $dbChestTable '
          'WHERE UserId =? AND Date >= ? AND Date <= ?',
          [
            userId,
            DateFormat('yyyy-MM-dd').format(startDate),
            DateFormat('yyyy-MM-dd').format(endDate),
          ]);
      List<Map<String, dynamic>> bicepsData = await db.rawQuery(
          'SELECT * FROM $dbBicepsTable '
          'WHERE UserId =? AND Date >= ? AND Date <= ?',
          [
            userId,
            DateFormat('yyyy-MM-dd').format(startDate),
            DateFormat('yyyy-MM-dd').format(endDate),
          ]);
      List<Map<String, dynamic>> backData = await db.rawQuery(
          'SELECT * FROM $dbBackTable '
          'WHERE UserId =? AND Date >= ? AND Date <= ?',
          [
            userId,
            DateFormat('yyyy-MM-dd').format(startDate),
            DateFormat('yyyy-MM-dd').format(endDate),
          ]);
      List<Map<String, dynamic>> tricepsData = await db.rawQuery(
          'SELECT * FROM $dbTricepsTable '
          'WHERE UserId =? AND Date >= ? AND Date <= ?',
          [
            userId,
            DateFormat('yyyy-MM-dd').format(startDate),
            DateFormat('yyyy-MM-dd').format(endDate),
          ]);

      List<Map<String, dynamic>> result = [];
      result.addAll(chestData);
      result.addAll(bicepsData);
      result.addAll(backData);
      result.addAll(tricepsData);
      print('All details');
      print(result);
      return result;
    } else {
      // Retrieve data from a specific table for the selected muscle type and date range
      String muscleTable = '';
      switch (muscleType) {
        case 'Chest':
          muscleTable = dbChestTable;
          break;
        case 'Biceps':
          muscleTable = dbBicepsTable;
          break;
        case 'Back':
          muscleTable = dbBackTable;
          break;
        case 'Triceps':
          muscleTable = dbTricepsTable;
          break;
      }

      String query = 'SELECT * FROM $muscleTable '
          'WHERE UserId =? AND Date >= ? AND Date <= ?';
      List<Map<String, dynamic>> specificData = await db!.rawQuery(query, [
        userId,
        DateFormat('yyyy-MM-dd').format(startDate),
        DateFormat('yyyy-MM-dd').format(endDate),
      ]);
      // Process the data for the specific muscle type...
      print('Specific Data:');
      print(specificData);
      return specificData;
    }
  }

  Future<Map<String, dynamic>> getRecommendation(
      int userId, String tableName) async {
    Database? db = await instance.database;
    //Get the current date in the format "yyyy-MM-dd"
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    print('table Name inside DB');
    print(tableName);
    // Query to get the row with the specified userId and date
    List<Map<String, dynamic>> overallRows = await db!.query(
      tableName,
      where: 'UserId = ? AND $columnDate=?',
      whereArgs: [userId, currentDate],
    );
    print('recommendation inside DB');
    print(overallRows);
    if (overallRows.isNotEmpty) {
      print('result');
      print(overallRows.first);
      return overallRows.first;
    } else {
      return {};
    }
  }
}
