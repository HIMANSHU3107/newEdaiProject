import 'package:firebase_auth/firebase_auth.dart';

class User1 {
  final String uid;

  User1({this.uid});
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firebase object
  User1 _userFromFirebaseUser(User user) {
    return user != null ? User1(uid: user.uid) : null;
  }

  Stream<User1> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
