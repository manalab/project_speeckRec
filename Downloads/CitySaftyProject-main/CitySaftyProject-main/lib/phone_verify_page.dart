import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'colors.dart' as col;
import 'texts.dart' as tx;
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'otp.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';



class PhoneVerify extends StatefulWidget {
  const PhoneVerify({Key? key}) : super(key: key);

  @override
  _PhoneVerifyState createState() => _PhoneVerifyState();
}

class _PhoneVerifyState extends State<PhoneVerify> {
  final maskFormatter = MaskTextInputFormatter(mask: 'XX#-#######', filter: { "#": RegExp(r'[0-9]') ,"X": RegExp(r'[0,5]') });
  final TextEditingController _phone= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: col.app_colors.background,
      body: Container(
        padding: const EdgeInsets.only(top:30,left: 20,right: 20),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 120,),
              Text(tx.app_texts.EnterPhon,
                style: GoogleFonts.stylish(
                  fontSize:28,
                  color: col.app_colors.explaneText,
                  fontWeight: FontWeight.w100,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: col.app_colors.buttom_shadow,
                      offset: Offset(1.0, 1.0),
                    ),

                  ],

                ),

              ),
              SizedBox(height: 40,),
              TextField(
               decoration: InputDecoration(
                 enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(color:col.app_colors.BorderSide, width: 2.0),
                   borderRadius: BorderRadius.circular(20.0),
                 ),
               focusedBorder:OutlineInputBorder(
                   borderSide: BorderSide(color:col.app_colors.BorderSide, width: 2.0),
                   borderRadius: BorderRadius.circular(20.0) ,

               ),
               prefixIcon: Icon(Icons.add_ic_call_outlined,color:col.app_colors.BorderSide,size: 20.0,),
               hintText: tx.app_texts.phoneNumber,
               fillColor: col.app_colors.textInputFill,
               filled: true,
               prefix: Padding(
               padding: EdgeInsets.all(4),
               child: Text("+972"),
               ) ),
                maxLength: 11,

                keyboardType: TextInputType.number,
                controller: _phone,
                inputFormatters: [maskFormatter],
              ),
              ElevatedButton(
                onPressed:(){
                  debugPrint(_phone.text);
                  Navigator.of(context).push(MaterialPageRoute(builder: (c)=>OTP(
                    phone:maskFormatter.getUnmaskedText(),

                  )));

                } ,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  primary:  col.app_colors.button,
                  minimumSize: Size(70.0, 50.0),
                ),
                child: Text(tx.app_texts.Next, style: TextStyle(color: col.app_colors.text_button,fontWeight:FontWeight.bold ),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
