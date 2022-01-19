import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wps_x/screens/sign_in.dart';
class PhoneList{
 static FirebaseFirestore 
    _firebaseFirestore =FirebaseFirestore.instance;
static Future<DocumentReference> addphoneList(String item){
 CollectionReference 
  _itemReference = _firebaseFirestore.collection("PhoneList");
 var data={
  'phn':item,
 };
 print("done");
 return _itemReference.add(data);
}
}


class AuthCon extends GetxController{
late  String smsOTP;
late  String verificationId;
String errorMessage = '';
FirebaseAuth _auth=FirebaseAuth.instance;
Future<void> authF(context,int a,{required String phone}) async {
 await _auth.verifyPhoneNumber(
 phoneNumber: "+977"+phone, // use your own country code
 timeout: const Duration(seconds: 60),
 verificationCompleted: _verificationCompleted,
 verificationFailed: _exceptionF,
 codeSent:(String verificationId,int? resendToken)async{
   this.verificationId=verificationId;
   _otpBox(context,a,phone);
   },
 codeAutoRetrievalTimeout: (String verificationId) {
   this.verificationId=verificationId;
  },);
}
 _verificationCompleted(PhoneAuthCredential credential)async{
   //  Navigator.of(context).pop();
   UserCredential result = 
     await _auth.signInWithCredential(credential);
   User? user = result.user;
   if(user != null){
     Get.to(()=> SignInX());
   }else{
    print("Error");
   }
  }
_exceptionF (FirebaseAuthException e) {
  if (e.code == 'invalid-phone-number') {
    print('The provided phone number is not valid.');
  }
 }
_otpBox(context,int a,String phone)=>showDialog(
  context: context,
  barrierDismissible: false,
  builder: (BuildContext context) {
  return new AlertDialog(
   title: Text('Enter SMS Code'),
   content: Container(
     height: 85,
     child: Column(
       children: [
         TextField(onChanged:(value){this.smsOTP = value;},),
         (errorMessage != '' ? 
            Text(errorMessage,style: TextStyle(color: Colors.red),)
            : Container())
         ]),),
   contentPadding: EdgeInsets.all(10),
   actions: <Widget>[
     FlatButton(
       child: Text('Done'),
       onPressed: ()async {
        AuthCredential credential = PhoneAuthProvider.credential
         (verificationId: verificationId, smsCode: smsOTP);
        UserCredential result = 
          await _auth.signInWithCredential(credential);
        User? user = result.user;
        if(user != null){
           if(a==0) await PhoneList.addphoneList(phone);
           Navigator.push(context, MaterialPageRoute(
              builder:(context) => SignInX()));
        }else{
         print("Error");
        }
})],);});

  signUP(BuildContext context, int i, {phone}) {}
}