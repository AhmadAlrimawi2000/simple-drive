import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:simple_drive_app/constants/utils.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  Rx<User?> user = Rx<User?>(FirebaseAuth.instance.currentUser);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());
  }

  Future<void> login() async {
    GoogleSignInAccount? gUser = await googleSignIn.signIn();
    if (gUser != null) {
      GoogleSignInAuthentication gAuth = await gUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: gAuth.idToken,
        accessToken: gAuth.accessToken,
      );
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      User? user = userCredential.user!;
      userCollection.doc(user.uid).set({
        "username": user.displayName,
        "profilepic": user.photoURL,
        "email": user.email,
        "uid": user.uid,
        "userCreated": DateTime.now()
      });
    }
  }
}
