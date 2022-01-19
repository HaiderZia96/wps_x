import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:wps_x/screens/otp.dart';
import 'package:wps_x/utils/colors.dart';


class MobileNumber extends StatefulWidget {
  MobileNumber({Key? key}) : super(key: key);

  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
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
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text("Let's enter your mobile number will send \n    you OTP for confirm your number",
                style: TextStyle(fontSize: 20),)),
                 Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      
                     decoration: InputDecoration(
                       label: Text("Mobile Number"),
                       hintText: "Mobile Number",
                       
                     ), 
                    ),
                  ),
                   SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 320,
                    
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OTP()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors_X.buttonColor,
                      shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(30)
                      )
                    ),
                     child: Text("Next",
                     style: TextStyle(fontSize: 18,color: Colors.white),)),
                  ),
            ])]))]));
  }
}