import 'entities/user.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
const MONGO_CONN_URL="mongodb+srv://DgyPptaUh1RCM3Uj:DgyPptaUh1RCM3Uj@cluster0.ly8tk.mongodb.net/CitySaftyDB?retryWrites=true&w=majority";
const USER_COLLECTION="users";

class MongoDatabase{
  static var db,userCollection;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    userCollection = db.collection(USER_COLLECTION);
  }


  static insert(User user) async {
    await userCollection.insertAll([user.toMap()]);

  }


  static Future<List<Map<String, dynamic>>> getDocuments() async {
    try {
      final users = await userCollection.find().toList();
      return users;
    } catch (e) {
      print(e);
      throw Future.value(e);
    }
  }


  static update(User user) async {
    var u = await userCollection.findOne({"_id": user.id});
    u["phone"] = user.phone;
    u["first_name"] = user.first_name;
    u["last_name"] = user.last_name;
    await userCollection.save(u);
  }

  static delete(User user) async {
    await userCollection.remove(where.id(user.id));
  }


}
