import 'package:flutter/material.dart';
import 'package:wps_x/firebase_auth/google_auth.dart';
import 'package:wps_x/utils/colors.dart';


class ThroughX extends StatefulWidget {
  const ThroughX({ Key? key }) : super(key: key);

  @override
  _ThroughXState createState() => _ThroughXState();
}

class _ThroughXState extends State<ThroughX> {

  final GoogleAuthX _authG = GoogleAuthX();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      backgroundColor: Colors_X.primaryColor,
      body:  Padding(
        padding: const EdgeInsets.fromLTRB(135, 290, 30, 30),
        child: Container(
                                 height: 60,
                                 width: 90,
                                 child: GestureDetector(
                                   onTap:()async{
                                    _authG.user_x.signOut();
                                   },
                                   child:ElevatedButton(child: Text("Logout"),onPressed: (){},)),
                                 ),
      ),
      
    );
  }
}