import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/home_screen.dart';
import 'colors.dart' as col;
import 'texts.dart' as tx;
import 'mongo_data_base.dart' as mDB;

import 'package:flutter/foundation.dart';

import 'dart:ui';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}



class _LoadingState extends State<Loading> {

  _navigatetoHome() async{
    await Future.delayed(Duration(milliseconds: 10000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));

  }
  void connect()async{
    await mDB.MongoDatabase.connect();

  }

  @override
  void initState(){
    debugPrint("here");
    connect();
    super.initState();
    _navigatetoHome();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color:col.app_colors.background,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 200,),
                Text(tx.app_texts.CitySafty,
                  style: GoogleFonts.caveat(
                    fontSize: 70,
                    color: col.app_colors.home_page_title,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: col.app_colors.buttom_shadow,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],

                  ),

                ),
                SizedBox(height: 100,),

                SpinKitRing(
                  color: col.app_colors.LoadingCirclr,
                  size:50.0,
                ),
              ],
            ),
          )
      ),
    );
  }
}
