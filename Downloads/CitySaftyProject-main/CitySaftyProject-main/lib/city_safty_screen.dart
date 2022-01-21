import 'package:flutter/material.dart';
import 'entities/user.dart';


class CitySafety extends StatefulWidget {
  final User user;


  CitySafety({required this.user});

  @override
  _CitySafetyState createState() => _CitySafetyState();
}

class _CitySafetyState extends State<CitySafety> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("sity safty screen", style: TextStyle(color: Colors.white),),
      ),
      body: Text ("welcome ${widget.user.first_name}"),



    );
  }
}
