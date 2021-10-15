import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late User _user;

  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await _auth.signInWithCredential(credential);
        _user = (_auth.currentUser)!;

        return "Success";
      } else {
        return "account not selected";
      }
    } catch (e) {
      return e.toString();
    }
  }

  String getNameOfGoogleAccount() {
    return _googleSignIn.currentUser!.displayName!;
  }

  Future<bool> isLoggedIn() {
    return _googleSignIn.isSignedIn();
  }

  Future<String> signInWithOTP(smsCode, verId) async {
    AuthCredential authCreds =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
    String singstat = await signIn(authCreds);
    return singstat;
  }

  Future<String> signIn(AuthCredential authCreds) async {
    String resturnString = "error";
    try {
      UserCredential authRes =
          await FirebaseAuth.instance.signInWithCredential(authCreds);

      User? _user = await authRes.user;
      if (_user != null && _user.phoneNumber != null) {
        resturnString = "noerror";
      } else {
        resturnString = "error";
      }
      return resturnString;
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<bool> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    return true;
  }
}
