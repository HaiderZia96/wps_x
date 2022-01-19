import 'package:flutter/material.dart';
import 'package:wps_x/firebase_auth/facebook_auth.dart';
import 'package:wps_x/firebase_auth/google_auth.dart';
import 'package:wps_x/screens/mobile_no.dart';
import 'package:wps_x/screens/moderator.dart';
import 'package:wps_x/screens/through.dart';
import 'package:wps_x/utils/colors.dart';


class SignInX extends StatefulWidget {
  const SignInX({ Key? key }) : super(key: key);

  @override
  _SignInXState createState() => _SignInXState();
}

class _SignInXState extends State<SignInX> {

  final GoogleAuthX _authG = GoogleAuthX();
  final Facebook_Auth1 _authFB = Facebook_Auth1();

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
                child: Text("Welcome Back!!",
                style: TextStyle(fontSize: 20),),
              ),
              Column(
                children: [
                 
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
                     child: Text("Sign in",
                     style: TextStyle(fontSize: 18,color: Colors.white),)),
                  ),
                   SizedBox(
                     height: 10,
                   ),
                   
                    Text("Forgot Password",
                         style: TextStyle(fontWeight: FontWeight.bold,
                         fontSize: 15),),
                          SizedBox(height:15),
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
                         fontSize: 15),),
                       ],
                     ),
                    
                   ),
                   SizedBox(height:20),
                    Text(".....OR.....",
                         style: TextStyle(fontWeight: FontWeight.bold,
                         fontSize: 12),),
                         SizedBox(height:35),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Container(
                               height: 40,
                               width: 40,
                               child: GestureDetector(
                                 onTap:()async{
                              await _authFB.signInWithFacebook();
                                 },
                                 child: Image(image: AssetImage("lib/images/facebook.png"))),
                               ),
                                Container(
                               height: 40,
                               width: 40,
                               child: GestureDetector(
                                 onTap: () async {
                            
                              await _authG.signInWithGoogle();
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> ThroughX()));
                                 },
                                 child: Image(image: AssetImage("lib/images/gplus.png"))),),
                                Container(
                               height: 40,
                               width: 40,
                               child: GestureDetector(
                                 onTap: (){
                                  
                                 },
                                 child: Image(image: AssetImage("lib/images/user.png")))),
                                Container(
                               height: 40,
                               width: 40,
                               child: Image(image: AssetImage("lib/images/viber.png"))),
                               
                           ],
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