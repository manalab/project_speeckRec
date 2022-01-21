import 'package:flutter/material.dart';
import 'inputDeco_design.dart';
import 'colors.dart' as col;
import 'texts.dart' as tx;
import 'package:google_fonts/google_fonts.dart';
import 'user_db.dart' as uDB;

class SignUp extends StatefulWidget {
  final String phone;


  SignUp({required this.phone});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  late String first_name,last_name;
  TextEditingController _fName=TextEditingController();
  TextEditingController _lName=TextEditingController();



  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: col.app_colors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  child: Image.network("https://media-exp1.licdn.com/dms/image/C560BAQE8Sps8bA5lIQ/company-logo_200_200/0/1626742585317?e=2159024400&v=beta&t=Z6WWerrBzxmrlmFBd3vh8KsasYw9g8NwIkrNhr4tJmg"),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person,tx.app_texts.firstName),
                    controller: _fName,
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return tx.app_texts.enterfirstName;
                      }
                      return null;
                    },
                    onSaved: (value){
                      first_name = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person,tx.app_texts.lastName),
                    controller: _lName,
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return tx.app_texts.enterlastName;
                      }
                      return null;
                    },
                    onSaved: (value){
                      last_name = value!;
                    },
                  ),
                ),
                SizedBox(height: 15,),
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
                      if(_formkey.currentState!.validate()){
                        debugPrint("successful");
                        debugPrint(widget.phone);
                        debugPrint(_fName.text);
                        debugPrint(_lName.text);
                        uDB.newUser(widget.phone,_fName.text,_lName.text);

                        return;
                      }
                      else{
                        debugPrint("unsuccessful");

                      }

                      },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(150.0)
                      ),
                      primary:  col.app_colors.button,
                      minimumSize: Size(100.0, 100.0),
                    ),
                    child: Column(
                      children: [
                        Text(tx.app_texts.submit,
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
          ),
        ),
      ),
    );
  }
}