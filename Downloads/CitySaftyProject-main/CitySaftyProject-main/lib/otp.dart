import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'entities/user.dart';
import 'user_db.dart' as udb;
import 'city_safty_screen.dart';
import 'signup_screen.dart';
class OTP extends StatefulWidget {


  final String phone;


  OTP({required this.phone});

  @override
  _OTPState createState() => _OTPState();
}


class _OTPState extends State<OTP> {
  final GlobalKey<ScaffoldState> _scaffoldkey= GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPCodeController= TextEditingController();
  final FocusNode _pinOTPCodeFoucus= FocusNode();
  String? varificationCode;
  String codeDigits="+972";

  final BoxDecoration pinOTPCodeDecoraton= BoxDecoration(
      color: Colors.blueAccent,
      borderRadius:  BorderRadius.circular(10.0),
      border: Border.all(color: Colors.grey,)

  );

  void findUser() async{
    var user=await udb.search(widget.phone);
    if(user==null){
      debugPrint("user not existed");
      Navigator.of(context).push(MaterialPageRoute(builder: (c)=>SignUp(
        phone: widget.phone,

      )));


    }
    else{
      debugPrint("existed user phone:${user.phone} name:${user.first_name} ${user.last_name}");

      Navigator.of(context).push(MaterialPageRoute(builder: (c)=>CitySafety(
          user: user

      )));

    }

  }

  @override
  void initState(){
    super.initState();
    verifyPhoneNumber();
  }

  verifyPhoneNumber() async{

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${codeDigits+widget.phone}",
      verificationCompleted: (PhoneAuthCredential credential) async{
        await FirebaseAuth.instance.signInWithCredential(credential).then((
            value) {
          if (value.user != null) {
            findUser();
            //Navigator.of(context).push(MaterialPageRoute(builder: (c) => VS()));
          }
        });
      },
      verificationFailed: (FirebaseAuthException e){
        FocusScope.of(context).unfocus();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message.toString(),),
              duration: Duration(seconds: 5),

            )
        );
      },
      codeSent: (String vId, int? resentToken){
        setState(() {varificationCode=vId;});
      }  ,
      codeAutoRetrievalTimeout: (String vId){
        setState(() {varificationCode=vId;});
      }
      ,
      timeout: Duration(seconds: 60),



    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('opt verification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: GestureDetector(
                onTap: (){verifyPhoneNumber();},
                child: Text("verifying: ${codeDigits}--${widget.phone}",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),

                ),

              ),

            ),

          ),
          Padding(
            padding:EdgeInsets.all(40.0),
            child:
            PinPut(
              fieldsCount: 6,
              textStyle: TextStyle(fontSize: 25.0,color: Colors.white),
              eachFieldWidth: 40.0,
              eachFieldHeight: 55.0,
              focusNode: _pinOTPCodeFoucus,
              controller: _pinOTPCodeController,
              submittedFieldDecoration: pinOTPCodeDecoraton,
              selectedFieldDecoration: pinOTPCodeDecoraton,
              followingFieldDecoration: pinOTPCodeDecoraton,
              pinAnimationType: PinAnimationType.rotation,
              onSubmit: (pin) async{
                try{
                  await FirebaseAuth.instance.signInWithCredential(
                      PhoneAuthProvider.credential(
                          verificationId: varificationCode!, smsCode: pin)).then((value) {
                    if(value.user!=null){
                      findUser();


                    }
                  });

                }
                catch(e){
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("invaild OTP"),
                        duration: Duration(seconds: 3),

                      )
                  );
                  Navigator.pop(context);

                }

              },
            ),

          ),

        ],
      ),



    );
  }
}
