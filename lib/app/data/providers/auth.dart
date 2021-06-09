import 'package:citas_app/app/data/model/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../repository/users_database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on firebaseuser

  String _userFromFirebaseUser(User user) {
    return user != null ? user.uid : null;
  }

  //auth change user stream
  Stream<String> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //Sing in anon

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in eith email & passwword
  Future singinWithEmailAndPassword(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }
  //register with email & password

  Future registerWithEmailAndPassword(UserModel user) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);

    if (result != null) {
      await UsersDataBase(uid: _userFromFirebaseUser(result.user)).create(user);
    }
    return result;
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
