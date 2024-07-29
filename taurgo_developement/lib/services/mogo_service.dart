import 'dart:io';
import 'package:mongo_dart/mongo_dart.dart';

// class MongoDatabase {
//   static Db? db;
//   static DbCollection? collection;
//
//   static Future<void> connect() async {
//     // Initialize the database connection
//     db = await Db.create(
//         "mongodb+srv://Mobile:NFEuw26liByYLKE2@cluster0.ez0vsjm.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0");
//     await db!.open();
//     collection = db!.collection('property-details');
//     // collection = db!.collection("");
//   }
//
//   static Future<void> insertImageDatas(List<File> imageFiles) async {
//     if (collection == null) {
//       throw Exception(
//           'Database connection is not initialized. Call connect() first.');
//     }
//     try {
//       List<Map<String, dynamic>> documents = [];
//       for (File imageFile in imageFiles) {
//         List<int> imageBytes = await imageFile.readAsBytes();
//         var document = {
//           'image': imageBytes,
//           'upload_date': DateTime.now(),
//         };
//         documents.add(document);
//       }
//       await collection!.insertMany(documents);
//       print("Images inserted successfully");
//     } catch (e) {
//       print("Error inserting images: $e");
//     }
//   }
//
//   static Future<void> insertData(Map<String, dynamic> data,
//       {List<File>? imageFiles}) async {
//     if (collection == null) {
//       throw Exception(
//           'Database connection is not initialized. Call connect() first.');
//     }
//     try {
//       // Generate a new ObjectId and add it to the data map
//       data['_id'] = ObjectId();
//
//       // If image files are provided, read their bytes and add to the data map
//       if (imageFiles != null && imageFiles.isNotEmpty) {
//         List<List<int>> imagesData = [];
//         for (File imageFile in imageFiles) {
//           List<int> imageBytes = await imageFile.readAsBytes();
//           imagesData.add(imageBytes);
//         }
//         data['images'] = imagesData;
//       }
//
//       await collection!.insertOne(data);
//       print("Data inserted successfully");
//     } catch (e) {
//       print("Error inserting data: $e");
//     }
//   }
//
//   static Future<void> disconnect() async {
//     // Close the database connection when it's no longer needed
//     await db!.close();
//   }
// }

class MongoDatabase {
  static Db? db;
  static DbCollection? collection;
  static bool isConnected = false;  // Track connection status

  static Future<void> connect() async {
    if (isConnected) {
      print("Database already connected");
      return;
    }
    try {
      db = await Db.create(
          "mongodb+srv://Mobile:NFEuw26liByYLKE2@cluster0.ez0vsjm.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0");
      await db!.open();
      collection = db!.collection('property-details');
      isConnected = true;  // Set connection status to true
      print("Database connected successfully");
    } catch (e) {
      print("Error connecting to the database: $e");
      throw Exception('Failed to connect to the database: $e');
    }
  }

  static Future<void> insertImageDatas(List<File> imageFiles, String category) async {
    if (collection == null) {
      throw Exception(
          'Database connection is not initialized. Call connect() first.');
    }
    try {
      List<Map<String, dynamic>> documents = [];
      for (File imageFile in imageFiles) {
        List<int> imageBytes = await imageFile.readAsBytes();
        var document = {
          'image': imageBytes,
          'upload_date': DateTime.now(),
          'category': category,
        };
        documents.add(document);
      }
      await collection!.insertMany(documents);
      print("Images inserted successfully");
    } catch (e) {
      print("Error inserting images: $e");
      throw Exception('Failed to insert images: $e');
    }
  }

  static Future<void> insertData(Map<String, dynamic> data,
      {List<File>? imageFiles}) async {
    if (collection == null) {
      throw Exception(
          'Database connection is not initialized. Call connect() first.');
    }
    print("DB Connected");
    try {
      data['_id'] = ObjectId();

      if (imageFiles != null && imageFiles.isNotEmpty) {
        List<List<int>> imagesData = [];
        for (File imageFile in imageFiles) {
          List<int> imageBytes = await imageFile.readAsBytes();
          imagesData.add(imageBytes);
        }
        data['images'] = imagesData;
      }

      await collection!.insertOne(data);
      print("Data inserted successfully");
    } catch (e) {
      print("Error inserting data: $e");
      throw Exception('Failed to insert data: $e');
    }
  }

  static Future<void> disconnect() async {
    if (db != null) {
      await db!.close();
      isConnected = false;  // Reset connection status
      print("Database disconnected successfully");
    } else {
      print("No active database connection to close");
    }
  }
}
