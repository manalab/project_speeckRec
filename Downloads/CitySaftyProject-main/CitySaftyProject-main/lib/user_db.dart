import 'mongo_data_base.dart';
import 'package:flutter/material.dart';
import 'entities/user.dart';
import 'package:mongo_dart/mongo_dart.dart';

void printAllusers() async{
  List l=await MongoDatabase.getDocuments();
  int i;
  for(i=0;i<l.length;i++)debugPrint("${l[i]['first_name']} ${l[i]['last_name']} ${l[i]['phone']}");
}

dynamic search(String phone) async{
  List l=await MongoDatabase.getDocuments();
  int i;
  for(i=0;i<l.length;i++) {
    if(l[i]['phone']==phone){
      final user = User(
          id: l[i]['_id'],
          phone: l[i]['phone'],
          first_name:l[i]['first_name'],
          last_name: l[i]['last_name']
      );
      return user;

    }

  }
return null;
}



void newUser(String phone,String fName,String lName )async{
  debugPrint("hahah");
  debugPrint(phone);
  debugPrint(fName);
  debugPrint(lName);
  if(await search(phone)==null){
    final id = ObjectId();
    final  user = User(
        id: id,
        phone: phone,
        first_name: fName,
        last_name: lName
    );
    await MongoDatabase.insert(user);
    printAllusers();

  }
  else debugPrint("A user with this  number (${phone}) already exists");



}