import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:wps_x/screens/mobile_no.dart';
import 'package:wps_x/screens/sign_in.dart';
import 'package:wps_x/utils/colors.dart';


class OTP extends StatefulWidget {
  const OTP({ Key? key }) : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors_X.primaryColor,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios,
        color: Colors_X.buttonColor,),
        elevation: 0,
        backgroundColor: Colors_X.primaryColor,
      ),
            body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 20, 30, 10),
                child: Container(
                  height: 60,
                  child: Image.asset("lib/images/conversation.png"),
                ),
              ),
               SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                child: Text("Verify mobile Number",
                style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.w900),),
              ),
            
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text("OTP has been ent to you on your mobile \n   number please enter it below.",
                style: TextStyle(fontSize: 20),)),
                 Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: OtpTextField(
        numberOfFields: 6,
        borderColor: Color(0xFF512DA8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: false, 
        //runs when a code is typed in
        onCodeChanged: (String code) {
            //handle validation or checks here           
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
            showDialog(
                context: context,
                builder: (context){
                return AlertDialog(
                    title: Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                );
                }
            );
        }, // end onSubmit
    ),
                  ),
                   SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 320,
                    
                    child: ElevatedButton(onPressed: (){


                      
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInX()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors_X.buttonColor,
                      shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(30)
                      )
                    ),
                     child: Text("Done",
                     style: TextStyle(fontSize: 18,color: Colors.white),)),
                  ),
            ])]))]));
  }
}