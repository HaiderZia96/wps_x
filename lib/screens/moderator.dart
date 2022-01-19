import 'package:flutter/material.dart';
import 'package:wps_x/firebase_auth/google_auth.dart';
import 'package:wps_x/utils/colors.dart';



class Moderator extends StatefulWidget {
  const Moderator({ Key? key }) : super(key: key);

  @override
  _ModeratorState createState() => _ModeratorState();
}

class _ModeratorState extends State<Moderator> {
   final GoogleAuthX _authG = GoogleAuthX();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_X.primaryColor,
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
                      height: 60,
                      width: 320,
                      
                      child: ElevatedButton(onPressed: (){
                      _authG.user_x.signOut();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors_X.buttonColor,
                        shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30)
                        )
                      ),
                       child: Text("LogOut",
                       style: TextStyle(fontSize: 18,color: Colors.white),)),
                    ),
      ),
      
    );
  }
}