import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthX {

final user_x = GoogleSignIn();

Future<UserCredential> signInWithGoogle() async {

// ignore: unused_local_variable
final GoogleSignInAccount? googleUser = await user_x.signIn();

final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

final credential = GoogleAuthProvider.credential(
 accessToken: googleAuth?.accessToken,
 idToken: googleAuth?.idToken  
);

return await FirebaseAuth.instance.signInWithCredential(credential);



}
 void _logOut() async {
   await user_x.disconnect();
   FirebaseAuth.instance.signOut();
 }

}
