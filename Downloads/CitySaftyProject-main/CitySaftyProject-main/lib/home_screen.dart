import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'colors.dart' as col;
import 'texts.dart' as tx;
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'phone_verify_page.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: col.app_colors.background,
      body: Container(
        padding: const EdgeInsets.only(top:30),

        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
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
              SizedBox(height: 40,),
              Text(tx.app_texts.HomepageExplane,
                style: GoogleFonts.caveat(
                  fontSize: 20,
                  color: col.app_colors.explaneText,
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: col.app_colors.buttom_shadow,
                      offset: Offset(3.0, 3.0),
                    ),
                  ],

                ),

              ),
              SizedBox(height: 40,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  boxShadow:[
                    BoxShadow(
                      color: col.app_colors.buttom_shadow,
                      blurRadius: 20,
                      offset: Offset(8,5)

                    ),
                    BoxShadow(
                        color: col.app_colors.buttom_shadow,
                        blurRadius: 20,
                        offset: Offset(-8,-5)

                    )
                  ]

                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (c) => PhoneVerify()));
                    debugPrint("citizen presed");},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(150.0)
                    ),
                    primary:  col.app_colors.button,
                    minimumSize: Size(100.0, 100.0),
                  ),
                  child: Text(tx.app_texts.Citizen,
                    style: GoogleFonts.caveat(
                        fontSize: 40,
                        color: col.app_colors.text_button,
                        fontWeight: FontWeight.w700
                    ),

                  ),
                ),
              ),
              SizedBox(height: 40,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    boxShadow:[
                      BoxShadow(
                          color: col.app_colors.buttom_shadow,
                          blurRadius: 20,
                          offset: Offset(8,5)

                      ),
                      BoxShadow(
                          color: col.app_colors.buttom_shadow,
                          blurRadius: 20,
                          offset: Offset(-8,-5)

                      )
                    ]

                ),
                child: ElevatedButton(
                  onPressed: () {debugPrint("center presed");},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150.0)
                    ),
                    primary:  col.app_colors.button,
                    minimumSize: Size(100.0, 100.0),
                  ),
                  child: Column(
                    children: [
                      Text(tx.app_texts.EmergencyCenter,
                        style: GoogleFonts.caveat(
                            fontSize: 25,
                            color: col.app_colors.text_button,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(tx.app_texts.EmergencyCenter2,
                        style: GoogleFonts.caveat(
                            fontSize: 25,
                            color: col.app_colors.text_button,
                            fontWeight: FontWeight.w700
                        ),
                      ),

                    ],
                  ),
                ),
              ),


            ],
          ),


      )
    )
    );
  }
}
