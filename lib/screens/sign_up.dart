// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wps_x/screens/mobile_no.dart';
import 'package:wps_x/utils/colors.dart';



class SignedUp extends StatefulWidget {
  const SignedUp({ Key? key }) : super(key: key);

  @override
  _SignedUpState createState() => _SignedUpState();
}

class _SignedUpState extends State<SignedUp> {

  bool _password = false;
  void _passwordX() => setState(() {
    _password =!_password;
  });

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
                child: Text("Let's get started",
                style: TextStyle(fontSize: 20),),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      
                     decoration: InputDecoration(
                       label: Text("Name"),
                       hintText: "Name",
                       
                     ), 
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      
                     decoration: InputDecoration(
                       label: Text("Email Address"),
                       hintText: "Email Address",
                       
                     ), 
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      
                     decoration: InputDecoration(
                       label: Text("Password"),
                       hintText: "Password",
                       
                     ), 
                    ),
                  ), Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      obscureText: _password,
                     decoration: InputDecoration(
                       label: Text("Confirm Password"),
                       hintText: "Confirm Password",
                       suffix: Icon(_password ? Icons.visibility_off_outlined: Icons.visibility_outlined),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MobileNumber()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors_X.buttonColor,
                      shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(30)
                      )
                    ),
                     child: Text("Sign Up",
                     style: TextStyle(fontSize: 18,color: Colors.white),)),
                  ),
                   SizedBox(
                     height: 10,
                   ),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(90, 10, 20, 10),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text("Already have an account!",
                         style: TextStyle(fontSize: 15),),
                         SizedBox(
                        width: 6,
                         ),
                         Text("Sign in",
                         style: TextStyle(fontWeight: FontWeight.bold,
                         fontSize: 15),)
                       ],
                     ),
                   )
                ],
              )
            ],
          ),
        )
      ],),

     
      
    );
  }
}