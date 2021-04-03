import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future signOut() async {
    await _auth.signOut();
  }

// stream of firebase user
  Stream<User> get FirebaseUser {
    print("\n\n\n\n\nFirebase User Stream called\n\n\n\n\n");
    Stream<User> firebaseuser = _auth.authStateChanges();
    print(_auth.currentUser);
    return firebaseuser;
  }

// google sign in
  String name;
  String email;
  String imageUrl;
  final googleSignIn = GoogleSignIn();

  Future<User> googleSignin() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;
    print("\n\n\n" + user.toString() + "\n\n\n");

    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    // Only taking the first part of the name, i.e., First Name
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;

    assert(user.uid == currentUser.uid);
    print("\n\n\n" + user.toString() + "\n\n\n");
    return currentUser;
  }

  Future<User> createUserWithEmailAndPAss(
      {String email, String password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      print("\n\n\n" + user.toString());

      if (user != null) return user;
    } catch (e) {
      print("\n\n\n" + e.toString());
      return null;
    }
  }

  Future<User> signInWithEmail({String email, String password}) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = authResult.user;
      print(user);

      return user;
    } catch (e) {
      print("Sign In failed\n\n\n");
      return null;
    }
  }
}
