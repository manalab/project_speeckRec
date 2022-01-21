import 'package:mongo_dart/mongo_dart.dart';

class User{
  final ObjectId id;
  final String phone;
  final String first_name;
  final String last_name;

  const User({required this.id,required this.phone,required this.first_name,required this.last_name});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'phone': phone,
      'first_name': first_name,
      'last_name': last_name
    };
  }


}